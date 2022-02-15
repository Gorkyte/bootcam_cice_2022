//
//  ListaPerfiPostCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 26/01/2022.
//

import UIKit

final class ListaPerfilPostCoordinator {
    
    static func navigation() -> UINavigationController{
        let navVC = UINavigationController(rootViewController: self.view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListaPerfilPostViewController()
        return vc
    }
    
}
