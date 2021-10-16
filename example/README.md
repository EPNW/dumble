# Examples for dumble.

## VM examples
All examples should be run from this folder (using `dart ./bin/<file>.dart`).

This examples use [opus_dart](https://pub.dev/packages/opus_dart) for audio encoding and decoding.

## Web examples
Convert the example you want to run to JavaScript, name it `out.js` and place it in `web` by using this command.
You can do all this with the following command (which uses the `connect_example.dart` as example file):
```sh
dart2js .\bin\connect_example.dart -o .\web\out.js
```
Next, use a http server to serve the `web` directory. For example, you could use the in dart written webserver `dhttpd`.
First install it globaly using
```sh
pub global activate dhttpd
```
Next, navigate into the `web` directory and run
```sh
pub global run dhttpd -p 8080
```
from there. Then, use your browser and go to `http://localhost:8080` and open the JavaScript console using the development-tools of the browser.