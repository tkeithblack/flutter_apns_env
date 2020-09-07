#import "FlutterApnsEnvPlugin.h"
#if __has_include(<flutter_apns_env/flutter_apns_env-Swift.h>)
#import <flutter_apns_env/flutter_apns_env-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_apns_env-Swift.h"
#endif

@implementation FlutterApnsEnvPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterApnsEnvPlugin registerWithRegistrar:registrar];
}
@end
