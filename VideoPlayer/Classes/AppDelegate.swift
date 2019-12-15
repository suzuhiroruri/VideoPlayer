//
//  AppDelegate.swift
//  VideoPlayer
//
//  Created by Hiromasa Suzuki on 9/16/19.
//  Copyright © 2019 Hiromasa Suzuki All rights reserved.
//

import UIKit
import AVKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {}

  func applicationDidEnterBackground(_ application: UIApplication) {}

  func applicationWillEnterForeground(_ application: UIApplication) {}

  func applicationDidBecomeActive(_ application: UIApplication) {}

  func applicationWillTerminate(_ application: UIApplication) {}

  func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    if let navigationController = self.window?.rootViewController as? UINavigationController {
      if navigationController.visibleViewController is MoviePlayerViewController {
        return UIInterfaceOrientationMask.all
      } else {
        return UIInterfaceOrientationMask.portrait
      }
    }
    return UIInterfaceOrientationMask.portrait
  }
}
