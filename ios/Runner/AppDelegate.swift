import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let channel = FlutterMethodChannel(name: "com.example.native_camera_app/hello",
                                         binaryMessenger: controller.binaryMessenger)
      channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
          if call.method == "getHelloMessage" {
              result("Hi, Mom!")
          } else {
              result(FlutterMethodNotImplemented)
          }
      }
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
