//
//  AppCoreCoordinator.swift
//  CiceMusic
//
//  Created by CICE on 06/02/2022.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController (window: UIWindow)
    func createSlidingMenu(window: UIWindow, vc: UIViewController, menuDto: [MenuResponse])
    //func application(application: UIApplication, window: UIWindow?) -> UIInterfaceOrientationMask
    
    var canRotate: Bool? { get set}
    var orientationEnable: UIInterfaceOrientationMask? {get}
}


final class AppCoreCoordinator {
    var actualVC = UIViewController()
    
    var canRotate: Bool?
    var orientationEnable: UIInterfaceOrientationMask?
    
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        self.actualVC = SplashCoordinator.view()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    func createSlidingMenu(window: UIWindow, vc: UIViewController, menuDto: [MenuResponse]) {
        let frontViewController = vc
        let rearViewController = MenuCoordinator.view(dto: MenuCoordinatorDTO(dataModel: menuDto))
        let swRevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController)
        swRevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swRevealVC?.toggleAnimationDuration = 0.30
        window.rootViewController = swRevealVC
        window.makeKeyAndVisible()
    }
    
    func application(application: UIApplication, window: UIWindow?) -> UIInterfaceOrientationMask  {
        
        if canRotate ?? false {
            return .all
        }else {
            return orientationEnable ?? .portrait
        }
    }
    
    
    
}
