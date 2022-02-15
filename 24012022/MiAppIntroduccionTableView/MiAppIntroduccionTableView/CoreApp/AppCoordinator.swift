//
//  AppCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 25/01/2022.
//

import UIKit

protocol AppCoordinatorProtocol {
    func setPrincipalViewController(window: UIWindow)
}


final class AppCoordinator {
    var actualViewController: UIViewController?
}


extension AppCoordinator: AppCoordinatorProtocol{
    
    func setPrincipalViewController(window: UIWindow) {
        self.actualViewController = HometabBarCoordinator.tabBarController()
        window.rootViewController = self.actualViewController
        window.makeKeyAndVisible()
    }
}


