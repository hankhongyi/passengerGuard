//
//  AppDelegate.swift
//  passengerGuard
//
//  Created by Huang, Hong-Yi (Agoda) on 4/19/2559 BE.
//  Copyright © 2559 Huang, Hong-Yi (Agoda). All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit
import MapKit
import CoreFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isUserLoggedIn = false

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //This is here to show how to add observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(facebookAccessTokenChanged), name: FBSDKAccessTokenDidChangeNotification, object: nil)
    
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func applicationDidFinishLaunching(application: UIApplication) {
        // initialize user defaults
        let dateKey = "dateKey"
        let lastRead = NSUserDefaults.standardUserDefaults().objectForKey(dateKey)
        if (lastRead == nil)     // App first run: set up user defaults.
        {
            let appDefaults: [String:NSDate] = [dateKey:NSDate()]
            // do any other initialization you want to do here - e.g. the starting default values.
            // [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"should_play_sounds"];
            
            // sync the defaults to disk
            NSUserDefaults.standardUserDefaults().registerDefaults(appDefaults)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: dateKey)
        
        if(FacebookEngine.sharedInstance().isFacebookUserLoggedIn()) {
            print("Logged in")
        } else {
            print("not logged in")
        }
    }
    
    //sample code for adding observer
    @objc func facebookAccessTokenChanged(notification:NSNotification) {
        let facebookEngine = FacebookEngine.sharedInstance()
        isUserLoggedIn = facebookEngine.isUserLoggedIn()
    }


}

