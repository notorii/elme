//
//  AppDelegate.swift
//  Codepath_CBT
//
//  Created by Margaret Bignell on 10/21/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("EQFjHyZBZbMYYlgDL7WjSSBH8Q8XU55LOWbcqZjn",
            clientKey: "FrzBgGqH3N3MePKV5HGrcw6ZCm6hBf4WM7xpvc3z")
        
        // user data only accessible by current user
        PFACL.setDefaultACL(PFACL(), withAccessForCurrentUser:true)
        
        let user = PFUser.currentUser()
        
        // skip login screen if user is logged in
        if user != nil {
            print("user check on launch - user \(user!.username) is logged in")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let nextStepHomeVC = storyboard.instantiateViewControllerWithIdentifier("NextStepViewViewController")
            let newGoalHomeVC = storyboard.instantiateViewControllerWithIdentifier("NewGoalHome")
            
            // this gets all the user's goal + any goals with global read/write permissions. technically there shouldn't be any goals with global read/write permissions...
            let goalQuery = PFQuery(className:"Goal")
            
            goalQuery.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) goals.")
                    
                    // if user has created a goal show next step home, otherwise show new goal home
                    if (objects!.count > 0) {
                        self.window?.rootViewController = nextStepHomeVC
                    } else {
                        self.window?.rootViewController = newGoalHomeVC
                    }
                    
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
            }
        }
    
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
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

