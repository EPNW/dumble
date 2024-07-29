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
* `WIP` Manage access lists
* `WIP` Plugin data transmission

## No audio recording or encoding functions?
A Mumble user typically uses a microphone to record a raw audio, which is then encoded using an audio codec and finally segemented by a mumble client and send to the mumble server.
Dumble is a transport client framework: It's not its task to record, play, encode or decode audio.
It just segements and transports already encoded streams, and ensures that they are transmitted according to the mumble specification.

Audio recording and playing depends on the underlying platform and is not abstracted by the `dart:vm`. It works different on Windows, Mac, Linux, IOS and Android, so every platform needs a different implementation. For example, on Linux you could use alsas and arecord, where Windows offers you its own api.

Why are no audio encoding and decoding tools are integrated?
Mumble supports different audio codecs, but in practice, opus is the only relevant up-to-date codec.
There is no pure dart implementation of opus, just wrappers for dart and flutter, which require additional building steps.
It's not possible to create an universal plug-in solution.
So if you are using dumble on flutter, integrate [opus_flutter](https://pub.dev/packages/opus_flutter) yourself.
And if you are using dumble without flutter, integrate [opus_dart](https://pub.dev/packages/opus_dart) yourself.

Keep in mind that dumble is a transport framework and not an app.

## Working example WITH audio recording and encoding
**HOWEVER** there is now [`dumble_audio`](https://github.com/EPNW/dumble_audio) which features audio recording and replay on iOS and Android with flutter. If this is what you want to achive, take a look at [this example](https://github.com/EPNW/dumble_audio/tree/master/examples/dumble_example).

## Mumble version
This package was designed for servers using Mumble 1.4, but some features are sill missing, see above.

## Further Null safety refinements
While the initial migration to null safety was done in version 0.8.0, there are some things that could be better and will be refined in the future:

* We are currently using `!` after a null check to promote instance variables, but we should switch to using local copies as suggested by [effective-dart](https://dart.dev/guides/language/effective-dart/usage#consider-copying-a-nullable-field-to-a-local-variable-to-enable-type-promotion).
* `ServerInfo` contains a lot of nullable fields right now. It might be possible to make them not-nullable if we could guarantee that a corresponding proto message is received while syncing, just like we are doing it for the clients crypt state and self fields. We have to double check that with the mumble protocol.
* The same goes for channels and users: What fields can actually be null? We need to check the mumble protocol on that. The problem here is that the Mumble.proto marks everything as optional but depending on the context, certian fields have to be there. To conclude, a deeper understanding of the protocol is needed to find the optimal solution here.

## Roadmap
See the [ROADMAP.md](./ROADMAP.md) on what steps are planned for the future of this package.

## Examples
There are several examples, showing how to use text chat, creating channels, and transmit audio.
They can all be found in the [example folder](https://github.com/EPNW/dumble/blob/master/example).