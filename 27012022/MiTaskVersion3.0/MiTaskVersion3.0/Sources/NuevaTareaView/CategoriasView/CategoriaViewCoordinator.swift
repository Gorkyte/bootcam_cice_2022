//
//  CategoriaViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//


import UIKit

final class CategoriaViewCoordinator {
    
    static func navigation () -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view(delegate: CategoriaViewControllerDelegate? = nil) -> UIViewController {
        
        let vc = CategoriaViewController()
        vc.delegate = delegate  // >>>>>>>> Se crea este delegado
        
        return vc
    }
    
}
