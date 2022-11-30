//
//  AppDelegate.swift
//  PG5601_eksamen
//
//  Created by jonathan solheim on 19/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = GroupingPageVC()
        window?.makeKeyAndVisible()
    

        return true
    }
}

