//
//  ListaPostViewController.swift
//  MiUserDefault
//
//  Created by CICE on 28/01/2022.
//

import UIKit

class ListaPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configuracionLogout()

        // Do any additional setup after loading the view.
    }

    private func configuracionLogout () {
        
        let button1 = UIBarButtonItem(image: UIImage(named: "house"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(logout)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1
        
    }
    
    @objc
    func logout () {
        Utils.Constants().kPrefs.setValue(false, forKey: Utils.Constants().kUserLogado)
        
        let vc = RegistroCoordinator.view()
        vc?.modalTransitionStyle = .coverVertical
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc ?? UIViewController (), animated: true, completion: nil)
        
    }

}
