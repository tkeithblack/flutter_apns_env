# flutter_apns_env

This Flutter plugin detects if a Flutter app is running in the APNS (Apple Push Notification Service) sandbox or in production mode. In other words, if it is using an iOS Development profile. 

This is important because when push messages are sent to iOS apps via the APNS Certificate-Based Connection, the server must use the correct certificate (sandbox or production) depending on how the iOS app is running. 


## Usage  
  
To use this plugin, add `flutter_apns_env` as a [dependency in your `pubspec.yaml` file](https://flutter.io/platform-plugins/).  
For example:  
```yaml  
dependencies:  
    flutter_apns_env: ^0.1.1
```  

There are two methods in `flutter_apns_env`.

**isIosAPNSandbox()** returns **true** if the app is running a development profile or is running in the simulator. Both require the server to use a sandbox Push Notification certificate.
If the app is not running under iOS then **false** is returned.

**isIosSimulator()** returns **true** if the app is running in an iOS simulator (emulator).

  
## Example  

```dart  
// Import package  
import 'package:flutter_apns_env/flutter_apns_env.dart';
  
// See if app requires server to use an APNS sandbox certificate.
var isSandbox = await FlutterApnsEnv.isIosAPNSandbox();

// See if app is running in an iOS simulator.
var isSimulator = await FlutterApnsEnv.isIosSimulator();
```  
