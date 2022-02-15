//
//  LoginViewController.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//


import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Variables globales
    var usuarioLogado = false
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var contentViewusername: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBAction func rememberMeACTION(_ sender: Any) {
        if datosCompletados(){
            self.usuarioLogado = true
            Utils.Constantes().kPrefs.setValue(self.usernameTF.text, forKey: Utils.Constantes().kUsername)
            Utils.Constantes().kPrefs.setValue(self.passwordTF.text, forKey: Utils.Constantes().kPassword)
            Utils.Constantes().kPrefs.setValue(self.usuarioLogado, forKey: Utils.Constantes().KUsuarioLogado)
            self.configuracionUI(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
            
        } else {
            self.present (Utils.muestrtaAlerta(titulo: "hey",
                                               mensaje: "Rellename el username y el password",
                                               completionHandler: nil),
                          animated: true,
                          completion: nil)
}
        
        

        
    }
    
    @IBAction func loginACTION(_ sender: Any) {
        if datosCompletados() {
            self.borrarDatosFormulario()
        } else {
            self.present (Utils.muestrtaAlerta(titulo: "hey",
                                               mensaje: "Rellename el username y el password",
                                               completionHandler: nil),
                          animated: true,
                          completion: nil)
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI(color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))

        // Do any additional setup after loading the view.
    }

    private func configuracionUI(color: UIColor){
        
        self.contentViewusername.backgroundColor = .clear
        self.contentViewusername.layer.cornerRadius = 37
        self.contentViewusername.layer.borderWidth = 2
        self.contentViewusername.layer.borderColor = color.cgColor
        
        self.contentViewPassword.backgroundColor = .clear
        self.contentViewPassword.layer.cornerRadius = 37
        self.contentViewPassword.layer.borderWidth = 2
        self.contentViewPassword.layer.borderColor = color.cgColor
        
        self.loginBTN.layer.cornerRadius = 22

        
    }
    
    private func datosCompletados() -> Bool {
        return !(self.usernameTF.text?.isEmpty ?? false) && !(self.passwordTF.text?.isEmpty ?? false)
    }
    
    private func borrarDatosFormulario() {
        self.usernameTF.text = ""
        self.passwordTF.text = ""
        self.mostrarHometabBar()
    }
    
    private func mostrarHometabBar() {
        let vc = HomeTabBarViewCoordinator.homeViewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present (vc, animated: true, completion: nil)
         
    }
    
}
