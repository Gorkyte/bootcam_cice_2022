//
//  AppCoreCoordinator.swift
//  MiUserDefault
//
//  Created by CICE on 27/01/2022.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func infitialViewController(window: UIWindow)
}

final class AppCoreCoordinator {
    var actualVC: UIViewController?
    
}





extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func infitialViewController(window: UIWindow) {
        self.actualVC = UIViewController()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
}


