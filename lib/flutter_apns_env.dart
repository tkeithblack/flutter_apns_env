import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FlutterApnsEnv {
  static const MethodChannel _channel = const MethodChannel('flutter_apns_env');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> isIosAPNSandbox() async {
    return !kIsWeb &&
        (Platform.isIOS ? await _channel.invokeMethod('isAPNSandbox') : false);
  }

  static Future<bool> isIosSimulator() async {
    return !kIsWeb &&
        (Platform.isIOS ? await _channel.invokeMethod('isSimulator') : false);
  }
}
