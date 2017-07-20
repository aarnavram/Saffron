//
//  AppDelegate.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 05/04/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
//        Auth.auth().signInAnonymously { (user: User?, error: Error?) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                let isAnonymous = user!.isAnonymous  // true
//                let uid = user!.uid
//                AppUser.currentUser = AppUser("12345678")
//            }
//        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userDef = UserDefaults.standard
        
        if let launchView = userDef.string(forKey: "vc") {
            if launchView == "appPage" {
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "appPage")
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
            } else {
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "disclaimerPage")
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
            }
        } else {
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "disclaimerPage")
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
        }
        initOfflineClient()

        return true
    }
    
    func initOfflineClient() {
        OfflineClient.sharedInstance.initArrays()
        OfflineClient.sharedInstance.parseIndian()
        OfflineClient.sharedInstance.parseChinese()
        OfflineClient.sharedInstance.parseFusion()
        OfflineClient.sharedInstance.parseDesserts()
        OfflineClient.sharedInstance.parseBeverages()
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
    }


}

