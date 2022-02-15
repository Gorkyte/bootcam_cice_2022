//
//  ListaPostsCoordinator.swift
//  MiUserDefault
//
//  Created by CICE on 28/01/2022.
//

import UIKit

final class ListaPostsCoordinator {
    
    static func navigation () -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListaPostViewController()
        return vc
    }
    
}
