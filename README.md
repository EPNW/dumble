# dumble 
dumble (dart+mumble) is a dart Mumble transport client framework.
It enables you to:
* Connect a Mumble server securly
* Join, create, delete (password-protected) channels
* Manage channel links
* Register, mute, deaf Users
* Kick, ban, unban, users
* See server and user stats
* Set channel and user comments
* Use channel or private text chat
* Whisper users
* Send and receive audio streams (but not record/play nor encode them, see below)
* Use TCP or fully encrypted UDP transport
* [WIP] Manage access lists

## No audio recording or coding functions?
A Mumble user typically uses a microphone to record a raw audio, which is then encoded using an audio codec and finally segemented by a mumble client and send to the mumble server.
Dumble is a transport client framework: It's not its task to record, play, encode or decode audio.
It just segements and transports already encoded streams, and ensures that they are transmitted according to the mumble specification.

Audio recording and playing depends on the underlying platform and is not abstracted by the dart:vm. It works different on Windows, Mac, Linux, IOS and Android, so every platform needs a different implementation. For example, on Linux you could use alsas a arecord, where Windows offers you its own api.

Ok, playing and recording is platform dependent but what about encoding and decoding?
Mumble supports different audio codecs, but in practice, opus is the only relevant up-to-date codec.
There is no pure dart implementation of opus, just wrappers for dart and flutter, which require additional building steps.
It's just not possible to create an universal plug in solution.
So if you are using dumble on flutter, just integrate [opus_flutter](https://pub.dev/packages/opus_flutter) yourself.
And if you are using dumble without flutter, integrate [opus_dart](https://pub.dev/packages/opus_dart) yourself.

Keep in mind that dumble is a framework and not an app.

## Mumble version
This package was designed for servers using Mumble 1.3.

## Examples
There are several examples, showing how to use text chat, creating channels, and transmitt audio.
They can all be found in the [example folder](https://github.com/EPNW/dumble/blob/master/example).