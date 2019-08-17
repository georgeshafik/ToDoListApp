//
//  AppDelegate.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // we have to tell our application what is the root view controller we will use
    
//    // sourced font from
//    // https://fonts.google.com/?query=Raleway&selection.family=Raleway
//    // verifying our font raleway is install and accessible from our app
//    // Rember we added to info.plist
//    // Fonts provided by application
//    //  array item 0 as Raleway-Regular.ttf
//
//    // These are how we access our fonts in code
//    family Raleway, font names ["Raleway-Regular"]
//    family Raleway SemiBold, font names ["Raleway-SemiBold"]
//
//    for family in UIFont.familyNames.sorted() {
//      let names = UIFont.fontNames(forFamilyName: family)
//      print(" family \(family), font names \(names)")
//    }
            
    let wc = WelcomeController()
    //print("did finish launching with options")
    

    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible() // makes our window the main key to our app
    
    //print(window?.frame)
    
    // now we need to specify what goes into this window
    //window?.rootViewController = ViewController() // placing an instance of ViewController in the root view controller
    window?.rootViewController = wc
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
//    self.saveContext()
  }




}

