import Flutter
import UIKit
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let filePath: String
    #if DEV
    filePath = Bundle.main.path(forResource: "GoogleService-Info-Dev", ofType: "plist")!
    #else
    filePath = Bundle.main.path(forResource: "GoogleService-Info-Prod", ofType: "plist")!
    #endif
    let options = FirebaseOptions(contentsOfFile: filePath)
    FirebaseApp.configure(options: options!)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
