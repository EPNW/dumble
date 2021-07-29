import 'dart:async';

class ExtendedCompleter<T> implements Completer<T> {
  final Completer<T> _base;
  bool _completedWithoutError;

  ExtendedCompleter()
      : this._base = new Completer<T>(),
        _completedWithoutError = false;

  @override
  void complete([FutureOr<T>? value]) {
    if (!_base.isCompleted) {
      _completedWithoutError = true;
    }
    _base.complete(value);
  }

  @override
  void completeError(Object error, [StackTrace? stackTrace]) {
    _base.completeError(error, stackTrace);
  }

  @override
  Future<T> get future => _base.future;

  @override
  bool get isCompleted => _base.isCompleted;

  bool get isCompletedWithoutError => isCompleted && _completedWithoutError;
}
