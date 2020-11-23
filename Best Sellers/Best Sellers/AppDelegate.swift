//
//  AppDelegate.swift
//  Best Sellers
//
//  Created by Eduardo Herzer on 20/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let initialViewController = BestSellerListVC()
        
        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
        
        return true
    }
}

