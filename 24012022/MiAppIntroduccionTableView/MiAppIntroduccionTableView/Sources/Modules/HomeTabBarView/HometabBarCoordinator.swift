//
//  HometabBarCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 25/01/2022.
//

import UIKit

final class HometabBarCoordinator {
    
    static func tabBarController () -> UITabBarController{
        
        let tabVC = HometabBarViewController()
        
        // Controladores
        let listaMeses = ListaCochesCoordinator.navigation()
        let listaCoches = ListaSuperCochesCoordinator.navigation()
        let listaPerfilPost = ListaPerfilPostCoordinator.navigation()
        
        // iconos
        let listaMesesIcon = UITabBarItem (title: "Meses",
                                           image: UIImage(systemName: "house"),
                                           selectedImage: UIImage(systemName: "house.fill"))
        
        let listaCochesIcon = UITabBarItem (title: "Coches",
                                            image: UIImage(systemName: "house"),
                                            selectedImage: UIImage(systemName: "house.fill"))
  
          let listaPerfilPostIcon = UITabBarItem (title: "Feed",
                                            image: UIImage(systemName: "person"),
                                            selectedImage: UIImage(systemName: "person.fill"))
  
    
        // asignar el icono al controlador
        listaMeses.tabBarItem = listaMesesIcon
        listaCoches.tabBarItem = listaCochesIcon
        listaPerfilPost.tabBarItem = listaPerfilPostIcon

         
        
        
        
        // Asigamos el array de controadores y su orden
        tabVC.viewControllers = [listaMeses, listaCoches, listaPerfilPost]
        return tabVC
        
    }
    
}

