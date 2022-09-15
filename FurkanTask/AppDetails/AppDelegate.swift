//
//  AppDelegate.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appManager.director.appStart()
        return true
    }

}

