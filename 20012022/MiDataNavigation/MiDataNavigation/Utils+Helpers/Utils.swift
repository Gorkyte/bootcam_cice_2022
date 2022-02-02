//
//  Utils.swift
//  MiDataNavigation
//
//  Created by CICE on 23/01/2022.
//

import Foundation
import UIKit
import MessageUI

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
    
    
    /// Description
    /// - Parameters:
    ///   - tag: Int
    ///   - delegate: UIPickerViewDelegate
    ///   - dataSource: UIPickerViewDataSource
    ///   - textField: UITextField
    ///   - dataArray: dataArray description

    func configuracionPickerView(tag: Int,
                                 delegate: UIPickerViewDelegate,
                                 dataSource: UIPickerViewDataSource,
                                 textField: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.tag = tag
        textField.inputView = pickerView
             
    }
  
    func dataIntextFieldEmpty(parametros: [String]) -> Bool {
        for item in parametros{
            if (item.isEmpty){
                return false
            }
        }
        return true
    }
    
    func configuracionMailCompose(delegate: MFMailComposeViewControllerDelegate, data: [String] ) ->  MFMailComposeViewController {
            let mailCompo = MFMailComposeViewController()
            mailCompo.mailComposeDelegate = delegate
            mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.es"])
            mailCompo.setSubject("ese es un mensaje para el equpo de soporte")
            let emailBody = "Los datos del formulario de registro son \(data)"
            mailCompo.setMessageBody(emailBody, isHTML: false)
            return mailCompo
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


