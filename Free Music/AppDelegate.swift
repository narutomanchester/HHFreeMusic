//
//  AppDelegate.swift
//  Free Music
//
//  Created by mac on 11/29/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var havingPlayBar : Bool = false
    
    func addPlayerViewBar() {
        let playerViewbar = Bundle.main.loadNibNamed("PlayerViewBar", owner: nil, options: nil)?.first as! CustomPlayerViewBar
        
        let rootview = self.window?.rootViewController?.view
        
        playerViewbar.frame = CGRect(x: 0, y: 0, width: (rootview?.frame.width)!, height: 50)
        playerViewbar.translatesAutoresizingMaskIntoConstraints = false
        rootview?.addSubview(playerViewbar)
        
        let horizontalConstraint = NSLayoutConstraint(item: playerViewbar, attribute: .centerX, relatedBy: .equal, toItem: rootview, attribute: .centerX, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: playerViewbar, attribute: .bottom, relatedBy: .equal, toItem: rootview, attribute: .bottom, multiplier: 1.0, constant: 0)
        let heightConstraint =  playerViewbar.heightAnchor.constraint(equalToConstant: 50)
        let widthConstraint = playerViewbar.widthAnchor.constraint(equalToConstant: (rootview?.frame.width)!)
        
        rootview?.addConstraints([horizontalConstraint, bottomConstraint, heightConstraint, widthConstraint])
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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


}

