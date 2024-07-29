import 'dart:typed_data';

ByteData _varIntSizeHelper = new ByteData(9);
int varIntSize(int value) => _varIntSizeHelper.setVarInt(0, value);
const int maxVarIntSize = 10; //9+1 for signed

const int _mask7 = 0x80,
    _mask14 = 0xC0,
    _mask21 = 0xE0,
    _mask28 = 0xF0,
    _mask32 = 0xFC,
    _mask64 = 0xFC,
    _maskNegative = 0xFC,
    _maskByteInverted = 0xFC;
const int _target7 = 0x00,
    _target14 = 0x80,
    _target21 = 0xC0,
    _target28 = 0xE0,
    _target32 = 0xF0,
    _target64 = 0xF4,
    _targetNegative = 0xF8,
    _targetByteInverted = 0xFC;
//Complementary masks, intended to use ~_mask but this will flip msb to and change sign...
const int _cmask7 = 0x7F,
    _cmask14 = 0x3F,
    _cmask21 = 0x1F,
    _cmask28 = 0x0F,
    _cmaskByteInverted = 0xFC;

extension VarIntExtension on ByteData {
  int setVarInt(int index, int value) {
    int lengthInBytes;
    if (value < 0) {
      this.setUint8(index, _targetNegative);
      lengthInBytes = 1 + this.setVarInt(index + 1, -value);
    } else if (value <= _cmask7) {
      this.setUint8(index, value);
      lengthInBytes = 1;
    } else if (value <= ((_cmask14 << 8) | 0xFF)) {
      this.setUint8(index, _target14 | (value >> 8));
      this.setUint8(index + 1, value & 0xFF);
      lengthInBytes = 2;
    } else if (value <= ((_cmask21 << 16) | 0xFFFF)) {
      this.setUint8(index, _target21 | (value >> 16));
      this.setUint16(index + 1, value & 0xFFFF);
      lengthInBytes = 3;
    } else if (value <= ((_cmask28 << 24) | 0xFFFFFF)) {
      this.setUint8(index, _target28 | (value >> 24));
      this.setUint16(index + 1, (value >> 8) & 0xFFFF);
      this.setUint8(index + 3, value & 0xFF);
      lengthInBytes = 4;
    } else if (value <= 0xFFFFFFFF) {
      this.setUint8(index, _target32);
      this.setUint32(index + 1, value);
      lengthInBytes = 5;
    } else if (value <= 0x7FFFFFFFFFFFFFFF) {
      this.setUint8(index, _target64);
      this.setUint64(index + 1, value);
      lengthInBytes = 9;
    } else {
      throw new ArgumentError.value(
          value, 'value', 'must not exceed 0x7FFFFFFFFFFFFFFF!');
    }
    return lengthInBytes;
  }

  VarIntResult getVarInt(int index) {
    int msb = this.getUint8(index);
    int lengthInBytes;
    int value;
    if ((msb & _mask7) == _target7) {
      value = msb;
      lengthInBytes = 1;
    } else if ((msb & _mask14) == _target14) {
      value = (msb & _cmask14) << 8 | this.getUint8(index + 1);
      lengthInBytes = 2;
    } else if ((msb & _mask21) == _target21) {
      value = (msb & _cmask21) << 16 | this.getUint16(index + 1);
      lengthInBytes = 3;
    } else if ((msb & _mask28) == _target28) {
      value = (msb & _cmask28) << 24 |
          this.getUint16(index + 1) << 8 |
          this.getUint8(index + 3);
      lengthInBytes = 4;
    } else if ((msb & _mask32) == _target32) {
      value = this.getUint32(index + 1);
      lengthInBytes = 5;
    } else if ((msb & _mask64) == _target64) {
      value = this.getUint64(index + 1);
      lengthInBytes = 9;
    } else if ((msb & _maskNegative) == _targetNegative) {
      VarIntResult recursive = this.getVarInt(index + 1);
      value = -1 * recursive.value;
      lengthInBytes = 1 + recursive.lengthInBytes;
    } else if ((msb & _maskByteInverted) == _targetByteInverted) {
      value = ~(msb & _cmaskByteInverted);
      lengthInBytes = 1;
    } else {
      throw new ArgumentError('No valid VarInt found at index $index!');
    }
    return new VarIntResult._(value, lengthInBytes);
  }
}

class VarIntResult {
  final int value;
  final int lengthInBytes;

  const VarIntResult._(this.value, this.lengthInBytes);

  @override
  bool operator ==(Object other) =>
      other is VarIntResult &&
      other.value == this.value &&
      other.lengthInBytes == lengthInBytes;

  @override
  int get hashCode => value + lengthInBytes;

  @override
  String toString() {
    return 'VarIntResult(value: $value, lengthInBytes: $lengthInBytes)';
  }
}
