import Flutter
import UIKit

public class SwiftFlutterApnsEnvPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_apns_env", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterApnsEnvPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getPlatformVersion" {
      result("iOS " + UIDevice.current.systemVersion)
    }
    else if call.method == "isAPNSandbox" {
      result(isAPNSandbox());
    }
    else if call.method == "isSimulator" {
      result(Platform.isSimulator);
    }
  }
}
