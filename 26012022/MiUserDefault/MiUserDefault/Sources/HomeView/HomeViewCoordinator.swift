//
//  HomeViewCoordinator.swift
//  MiUserDefault
//
//  Created by CICE on 28/01/2022.
//

import UIKit

final class HomeViewCoordinator {
    
    
    
    static func homeView() -> UITabBarController {
        let homeVC = HomeViewController()
        
        let listaCochesVC = ListaCochesCoordinator.navigation()
        let listaPostVC = ListaPostsCoordinator.navigation()
        
        let iconCoches = UITabBarItem(title: "Coches",
                                      image: UIImage(systemName: "house"),
                                      selectedImage: UIImage(systemName: "house.fill"))
        
        let iconPost = UITabBarItem(title: "Post",
                                      image: UIImage(systemName: "house"),
                                      selectedImage: UIImage(systemName: "house.fill"))
        
        listaCochesVC.tabBarItem = iconCoches
        listaPostVC.tabBarItem = iconPost
        
        homeVC.viewControllers = [listaCochesVC, listaPostVC]
        
        
        // TODO: - tarea para los alumnos
        
        var vc = RegistroCoordinator.view()
        vc = nil
        
        
        return homeVC
        
        }
    
}
