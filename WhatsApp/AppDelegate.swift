//
//  AppDelegate.swift
//  WhatsApp
//
//  Created by Mag isb-10 on 24/08/2024.
//

import UIKit
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    Thread.sleep(forTimeInterval: 1.0)
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: String(describing: "OtpVerificationVC")) as? OtpVerificationVC
    let navigation = UINavigationController(rootViewController: controller!)
    self.window?.rootViewController = navigation
    
    IQKeyboardManager.shared().isEnabled = true
    IQKeyboardManager.shared().shouldResignOnTouchOutside = true
    
    if #available(iOS 15, *) {
      let navigationBarAppearance = UINavigationBarAppearance()
      navigationBarAppearance.configureWithOpaqueBackground()
      navigationBarAppearance.titleTextAttributes = [
        NSAttributedString.Key.foregroundColor : UIColor.label
      ]
      navigationBarAppearance.backgroundColor = UIColor.BLACKWHITE
      UINavigationBar.appearance().standardAppearance = navigationBarAppearance
      UINavigationBar.appearance().compactAppearance = navigationBarAppearance
      UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
      
      // MARK: Tab bar appearance
      //         let tabBarAppearance = UITabBarAppearance()
      //         tabBarAppearance.configureWithOpaqueBackground()
      //         tabBarAppearance.backgroundColor = UIColor.white
      //         UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
      //         UITabBar.appearance().standardAppearance = tabBarAppearance
    }
    
    return true
  }
  
  // MARK: UISceneSession Lifecycle
  
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
  
  
}

