//
//  MyDelegate.swift
//  ReviewMVC_swift
//
//  Created by Michael on 01/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class MyDelegate: NSObject, UIApplicationDelegate {
    var window:UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = UIColor.blue
        window?.makeKeyAndVisible()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window?.rootViewController = storyboard.instantiateInitialViewController()
        return true
    }
}
