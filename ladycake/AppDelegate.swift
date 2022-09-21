//
//  AppDelegate.swift
//  ladycake
//
//  Created by Arman on 2/16/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        let navController = UINavigationController()
        let mainView = MainViewController()
        navController.viewControllers = [mainView]
        self.window?.rootViewController = navController
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.makeKeyAndVisible()
//        let navController = UINavigationController()
//        let mainView = MainViewController()
//        navController.viewControllers = [mainView]
//        self.window?.rootViewController = navController
        
//
//
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        let navigationController = UINavigationController()
//        let mainView = ViewController(nibName: nil, bundle: nil)
//        navigationController.viewControllers = [mainView]
//        window.rootViewController = navigationController
//        window.makeKeyAndVisible()
//
        // Override point for customization after application launch.
        return true
        
    }


}

