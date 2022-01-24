//
//  Utils.swift
//  MiDataNavigation
//
//  Created by CICE on 23/01/2022.
//

import Foundation
import UIKit


class Utils {
    
    static let shared = Utils()
    
    
    /// method showAlertVC retun a alert generic componente
    /// - Parameters:
    ///   - TITLE: TITLE put from VC to Alert generic component
    ///   - message: message put from VC to Alert generic component
    /// - Returns: returnUIAlertController
            
    
    func showAlertVC(TITLE: String, message: String) -> UIAlertController {
        let alertVC = UIAlertController (title: TITLE, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction (title: "OK", style: .default, handler: nil))
        return alertVC
    }
    
}


struct DatosUsuarioModel {
    var nombreData: String?
    var apellidoData: String?
    var telefonoData: String?
    var direccionData: String?
    var edadPerroData: String?
    var codigoPostalData: String?
    var ciudadData: String?
    var posiconGeograficaData: String?
}


