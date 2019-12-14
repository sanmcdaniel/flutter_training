import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    
       let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
       let flutterChannel = FlutterMethodChannel(name: "native_call",
                                                 binaryMessenger: controller.binaryMessenger)
       
       flutterChannel.setMethodCallHandler { (call : FlutterMethodCall, result: @escaping FlutterResult)  -> Void  in
           
           
           if call.method == "show_view" {
               
               if let text = call.arguments as? String {
                   self.window?.rootViewController = nil
                   
                   let viewToPush = DetailViewController()
                viewToPush.content = text
                   
                   let navigationController = UINavigationController(rootViewController: controller)
                   
                   self.window = UIWindow(frame: UIScreen.main.bounds)
                   self.window?.makeKeyAndVisible()
                   self.window.rootViewController = navigationController
                   navigationController.isNavigationBarHidden = false
                   navigationController.pushViewController(viewToPush, animated: false)
               }
           }
       }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
