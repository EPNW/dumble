# [0.8.5] - 19.07.2021
  * Introduced [`AudioClient.incomingAudioStreamTimeout`](https://pub.dev/documentation/dumble/latest/dumble/AudioClient/incomingAudioStreamTimeout.html) to close incomig audio streams if no next frame is received, but no end-frame neither

# [0.8.4] - 13.07.2021
  * Fixed a bug where `close`ing a client multiple times causes an exception

# [0.8.3] - 12.07.2021
  * Fixed a bug where actions on a user (e.g. muting) targeted `self` instead

# [0.8.2] - 11.07.2021
  * Some typos
  * Fixed a bug where all changes on a user (e.g. comment) were also detected as channel changes

# [0.8.1] - 19.06.2021
  * Minor internal fixes

# [0.8.0] - 19.06.2021
  * Null safety (but not as great as it could be)
    * See the [README.md](./README.md) why futher null safety refinements are desired 
  * Targeting Mumble 1.4
    * We are targeting the `Mumble.proto` from [mumble-voip/mumble#27dbee8e620877f9a1668b1d58c7269a48c7e229](https://github.com/mumble-voip/mumble/blob/27dbee8e620877f9a1668b1d58c7269a48c7e229/src/Mumble.proto)
    * Plugin data transmission was not yet added
    * ACL support is still missing
    * Introduced listening channels for users
  * API changes
     * Most notably the connection process is now more dart like by utilizing a static connect method, just like [Socket.connect](https://api.dart.dev/stable/dart-io/Socket/connect.html)
     * For some types we now differntiate between incoming and outgoing direction because they have different requirements on when a field can be null
     * Also, the typo in the `Selfe` type was corrected, so the types new name is `Self` now 
  * Internal structure changes
  * Some big files where split up into multiple files, at the cost of more `@protected` and `hide` directives. This structural change allows us to define the following convention: The file that declares a type is responsible for constructing it from a proto message.This makes it easier to check the proto messages fields for allowed values since everything is structured more clearly.
  * Additional bug fixes 


# [0.7.2] - 03.08.2020
  * Implemented already complete guard for AudioFrameSink

# [0.7.0] - 04.07.2020
  * Worked on documentation
  * Minor bug fixes
  * Overhauled examples