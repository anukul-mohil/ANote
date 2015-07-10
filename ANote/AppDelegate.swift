//
//  AppDelegate.swift
//  ANote
//
//  Created by Mohil, Anukul | Anukul | OPS on 6/5/15.
//  Copyright (c) 2015 Mohil, Anukul | Anukul | OPS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //Actions
        var firstAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        firstAction.identifier = "First_Action"
        firstAction.title = "First Action"
        
        //Misc features
        //Background notification i.e doesn't launches an app but does something in the background depending on the result of the notification's answer
        firstAction.activationMode = UIUserNotificationActivationMode.Background
        firstAction.destructive = true
        firstAction.authenticationRequired = false
        
        var secondAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        secondAction.identifier = "Second_Action"
        secondAction.title = "Second Action"
        
        //Misc features
        //Background notification i.e doesn't launches an app but does something in the background depending on the result of the notification's answer
        secondAction.activationMode = UIUserNotificationActivationMode.Foreground
        secondAction.destructive = false
        secondAction.authenticationRequired = false
        
        
        var thirdAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        thirdAction.identifier = "Third_Action"
        thirdAction.title = "Third Action"
        
        //Misc features
        //Background notification i.e doesn't launches an app but does something in the background depending on the result of the notification's answer
        thirdAction.activationMode = UIUserNotificationActivationMode.Background
        thirdAction.destructive = false
        thirdAction.authenticationRequired = false
        
        //Category
        
        var firstCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        firstCategory.identifier = "First_category"
        
        let defaultActions:NSArray = [firstAction,secondAction,thirdAction]
        let miinimalActions:NSArray = [firstAction,secondAction]
        //Add these actions to the cateogry
        firstCategory.setActions(defaultActions as [AnyObject], forContext: UIUserNotificationActionContext.Default)
        firstCategory.setActions(miinimalActions as [AnyObject], forContext: UIUserNotificationActionContext.Minimal)
        
        //NSSet for all categories
        
        let categories:NSSet = NSSet(object: firstCategory)
        
        
        //Types of notifications
        let types:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge
        
        //Settings for the above mentioned types
        let mySettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: categories as Set<NSObject>)
        
        //Registering this appliation with the above settings
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
        
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

