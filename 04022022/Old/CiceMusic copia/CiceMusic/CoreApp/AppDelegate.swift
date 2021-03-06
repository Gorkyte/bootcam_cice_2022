//
//  AppDelegate.swift
//  CiceMusic
//
//  Created by CICE on 06/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    let appCore: AppCoreCoordinatorProtocol = AppCoreCoordinator()
    
 

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
        
        self.window = UIWindow (frame: UIScreen.main.bounds)
        if let windowUnW = self.window {
            self.appCore.initialViewController(window: windowUnW)
        }
        
        
        return true
    }



}

