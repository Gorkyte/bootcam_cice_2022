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
    
    var canRotate = false
    //var orientationEnable: UIInterfaceOrientationMask = .portrait
    
    //MARK: - Variables globales
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
        
        self.window = UIWindow (frame: UIScreen.main.bounds)
        if let windowUnW = self.window {
            self.appCore.initialViewController(window: windowUnW)
        }
        return true
    }

    
    // MARK: - Autorotations
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        //self.appCore.application(application:application, window: window)
        if canRotate {
            return .all
        }
        else {
            return .portrait
        }
        
    }


}

