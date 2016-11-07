//
//  AppDelegate.swift
//  Twitter
//
//  Created by Liang Rui on 10/25/16.
//  Copyright © 2016 Etcetera. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if User.currentUser != nil {
            print("There is a current user")
            /*
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TweetsNav")
            window?.rootViewController = vc
            */
 
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HamburgerViewController")
            self.window?.rootViewController = vc
            
            let hamburgerViewController = window!.rootViewController as! HamburgerViewController
            let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            
            menuViewController.hamburgerViewController = hamburgerViewController
            hamburgerViewController.menuViewController = menuViewController
            
        }
        let notificationName = NSNotification.Name("UserDidLogout")
        NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: OperationQueue.main) {
            (notification:Notification) in
            print("Logging out!")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.window?.rootViewController = vc
        }
        
        
        /*
        if User.currentUser != nil {
            print("There is a current user")/*
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TweetsNav")
            window?.rootViewController = vc*/
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HamburgerNavController")
            self.window?.rootViewController = vc
            
            let hamburgerNavController = window!.rootViewController
            let hamburgerViewController = hamburgerNavController?.childViewControllers[0] as! HamburgerViewController
            
            
            let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            
            menuViewController.hamburgerViewController = hamburgerViewController
            hamburgerViewController.menuViewController = menuViewController
            
            
        }
        let notificationName = NSNotification.Name("UserDidLogout")
        NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: OperationQueue.main) {
            (notification:Notification) in
            print("Logging out!")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.window?.rootViewController = vc
        }
        */
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
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        print(url.query)
        
        let client = TwitterClient.sharedInstance
        client.handleOpenUrl(url: url)
        
        return true
    }
    

}

