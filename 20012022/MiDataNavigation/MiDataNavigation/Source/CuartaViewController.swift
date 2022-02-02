//
//  CuartaViewController.swift
//  MiDataNavigation
//
//  Created by CICE on 23/01/2022.
//

import UIKit
import MessageUI

class CuartaViewController: UIViewController {
    
    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    @IBOutlet weak var miTelefonoLBL: UILabel!
    @IBOutlet weak var miDireccionLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    @IBOutlet weak var codigoPostalLBL: UILabel!
    @IBOutlet weak var ciudadLBL: UILabel!
    @IBOutlet weak var posicionGeoLBLl: UILabel!
    
    
    @IBAction func enviarTodaLaIformacionMailACTION(_ sender: UIButton) {
    
        if MFMailComposeViewController.canSendMail() {
            self.present(Utils.shared.configuracionMailCompose(delegate: self,
                                                               data: [self.miNombreLBL.text ?? ""]),
                        animated: true,
                        completion: nil)
        } else {
            self.present(Utils.shared.showAlertVC(TITLE: "Que pasa!!",
                                                  message: "Estas en un Simulador y no puedes enviar email"),
                         animated: true,
                         completion: nil)
        }
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()

        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI() {
        self.miNombreLBL.text = datosUsuario.nombreData
        self.miApellidoLBL.text = datosUsuario.apellidoData
        self.miTelefonoLBL.text = datosUsuario.telefonoData
        self.miDireccionLBL.text = datosUsuario.direccionData
        self.edadPerroLBL.text = datosUsuario.edadPerroData
        self.codigoPostalLBL.text = datosUsuario.codigoPostalData
        self.ciudadLBL.text = datosUsuario.ciudadData
        self.posicionGeoLBLl.text = datosUsuario.posiconGeograficaData
    }


}
   
extension CuartaViewController: MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    }

}
