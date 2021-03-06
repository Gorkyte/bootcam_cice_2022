//
//  SplashRouter.swift
//  CiceMusic
//
//  Created by CICE on 06/02/2022.
//

import Foundation

// Input del Router
protocol SplashRouterInputProtocol {
    func showHometabBarRouter(dataSource: [MenuResponse])
    func showAlert (title: String, message: String)
}

final class SplashRouter: BaseRouter<SplashViewController>{
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let appCore: AppCoreCoordinatorProtocol = AppCoreCoordinator()
}






// Input del Router
extension SplashRouter: SplashRouterInputProtocol {
    
    func showHometabBarRouter(dataSource: [MenuResponse]) {
        DispatchQueue.main.async {
            let vc = HomeTabBarCoordinator.tabBarController()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            if let windowUnw = self.delegate.window {
                self.appCore.createSlidingMenu(window: windowUnw, vc: vc, menuDto: dataSource)
            }          
        }
    }
    
    func showAlert (title: String, message: String) {
        DispatchQueue.main.async {
            self.viewController?.present(Utils.showAlert(title: title, message: message), animated: true, completion: nil)
        }
        
    }
}
