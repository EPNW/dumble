import '../utils/utils.dart' show JsonString;

class Permission with JsonString {
  // Values from https://github.com/mumble-voip/mumble/blob/master/src/ACL.h
  static const int _write = 0x1,
      _traverse = 0x2,
      _enter = 0x4,
      _speak = 0x8,
      _muteDeafen = 0x10,
      _move = 0x20,
      _makeChannel = 0x40,
      _linkChannel = 0x80,
      _whisper = 0x100,
      _textMessage = 0x200,
      _makeTempChannel = 0x400,
      _listen = 0x800,
      // Root channel only
      _kick = 0x10000,
      _ban = 0x20000,
      _register = 0x40000,
      _selfRegister = 0x80000,
      _resetUserContent = 0x100000,
      _cached = 0x8000000;

  final bool write;
  final bool traverse;
  final bool enter;
  final bool speak;
  final bool muteDeafen;
  final bool move;
  final bool makeChannel;
  final bool linkChannel;
  final bool whisper;
  final bool textMessage;
  final bool makeTempChannel;
  final bool listen;
  //root channel only
  final bool kick;
  final bool ban;
  final bool register;
  final bool selfRegister;
  final bool resetUserContent;

  final int intValue;

  const Permission.fromInt(int value)
      : this.intValue = value,
        this.write = (value & _write) != 0,
        this.traverse = (value & _traverse) != 0,
        this.enter = (value & _enter) != 0,
        this.speak = (value & _speak) != 0,
        this.muteDeafen = (value & _muteDeafen) != 0,
        this.move = (value & _move) != 0,
        this.makeChannel = (value & _makeChannel) != 0,
        this.linkChannel = (value & _linkChannel) != 0,
        this.whisper = (value & _whisper) != 0,
        this.textMessage = (value & _textMessage) != 0,
        this.makeTempChannel = (value & _makeTempChannel) != 0,
        this.listen = (value & _listen) != 0,
        this.kick = (value & _kick) != 0,
        this.ban = (value & _ban) != 0,
        this.register = (value & _register) != 0,
        this.selfRegister = (value & _selfRegister) != 0,
        this.resetUserContent = (value & _resetUserContent) != 0;

  const Permission(
      {bool write: false,
      bool traverse: false,
      bool enter: false,
      bool speak: false,
      bool muteDeafen: false,
      bool move: false,
      bool makeChannel: false,
      bool linkChannel: false,
      bool whisper: false,
      bool textMessage: false,
      bool makeTempChannel: false,
      bool listen: false,
      bool kick: false,
      bool ban: false,
      bool register: false,
      bool selfRegister: false,
      bool resetUserContent: false})
      : this.write = write,
        this.traverse = traverse,
        this.enter = enter,
        this.speak = speak,
        this.muteDeafen = muteDeafen,
        this.move = move,
        this.makeChannel = makeChannel,
        this.linkChannel = linkChannel,
        this.whisper = whisper,
        this.textMessage = textMessage,
        this.makeTempChannel = makeTempChannel,
        this.listen = listen,
        this.kick = kick,
        this.ban = ban,
        this.register = register,
        this.selfRegister = selfRegister,
        this.resetUserContent = resetUserContent,
        this.intValue = (write ? _write : 0) |
            (traverse ? _traverse : 0) |
            (enter ? _enter : 0) |
            (speak ? _speak : 0) |
            (muteDeafen ? _muteDeafen : 0) |
            (move ? _move : 0) |
            (makeChannel ? _makeChannel : 0) |
            (linkChannel ? _linkChannel : 0) |
            (whisper ? _whisper : 0) |
            (textMessage ? _textMessage : 0) |
            (makeTempChannel ? _makeTempChannel : 0) |
            (listen ? _listen : 0) |
            (kick ? _kick : 0) |
            (ban ? _ban : 0) |
            (register ? _register : 0) |
            (selfRegister ? _selfRegister : 0) |
            (resetUserContent ? _resetUserContent : 0);

  @override
  int get hashCode => intValue;

  @override
  bool operator ==(dynamic other) {
    if (other != null && other is Permission) {
      return (intValue | _cached) == (other.intValue | _cached);
    } else {
      return false;
    }
  }

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['write'] = write
    ..['traverse'] = traverse
    ..['enter'] = enter
    ..['speak'] = speak
    ..['muteDeafen'] = muteDeafen
    ..['move'] = move
    ..['makeChannel'] = makeChannel
    ..['linkChannel'] = linkChannel
    ..['whisper'] = whisper
    ..['textMessage'] = textMessage
    ..['makeTempChannel'] = makeTempChannel
    ..['listen'] = listen
    ..['kick'] = kick
    ..['ban'] = ban
    ..['register'] = register
    ..['selfRegister'] = selfRegister
    ..['resetUserContent'] = resetUserContent;
}
