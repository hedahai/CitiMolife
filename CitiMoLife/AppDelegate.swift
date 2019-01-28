//
//  AppDelegate.swift
//  CitiMoLife
//
//  Created by 何大海 on 2018/10/1.
//  Copyright © 2018年 tiny. All rights reserved.
//

import UIKit
import WebKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let viewContorller = MainViewController()
        let navigationController = UINavigationController(rootViewController:viewContorller)
        navigationController.navigationBar.barTintColor = CITI_BLUE
        self.window?.rootViewController = navigationController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
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
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if url.host == nil {
            return true
        } else {
            //获取url以及参数 citimolife://test.uat2.com/index.htm?s=lpa&p=123
            let absoluteString = url.absoluteString
            print(absoluteString)
            
            let urlString = absoluteString.replacingOccurrences(of: "citimolife:", with: "https:")
            
            //let vc = PreLoginViewController()
            let vc = LoginViewController()
            vc.url = urlString
            vc.window = self.window
            self.window?.rootViewController = vc
            
        }
        
        return true
    }


}

