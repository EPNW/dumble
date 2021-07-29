/// A protocol exception occours if this client implementation receives a message
/// from the mumble server that is in this clients opinion not a valid message.
///
/// If this happens, something in this client library is most likely implemented
/// based on a wrong understanding of the mumble protocol. A developer using
/// this client library should open a issue on [GitHub](https://github.com/EPNW/dumble) immediately.
class ProtocolException implements Exception {
  /// The message describes how the protocol was violated.
  final String message;

  ProtocolException(this.message);

  @override
  String toString() => message;
}

/// An `UnhandeledError` is thrown if an error or exception in a
/// [MumlbeClient] with no registered [MumbleClientListener]s occurs.
///
/// Since in this case, there is no one to report the actual error to,
/// an `UnhandeledError`, containing the cause, is thrown.
class UnhandeledError extends Error {
  /// The stack trace of the error/exception that was unhandeled.
  final StackTrace? causeStackTrace;

  /// The error/exception that was unhandeled.
  final Object causeError;

  UnhandeledError(this.causeError, this.causeStackTrace);

  @override
  String toString() {
    return '''UnhandeledError: An error occured in a MumlbeClient with no registered MumbleClientListeners.
Since there is no one to report this error to, an UnhandeledError was thrown.

The error that caused this was:
$causeError
${causeStackTrace ?? ''}''';
  }
}
