//
//  CustomAlertManager.swift
//  CiceMusic
//
//  Created by CICE on 16/02/2022.
//

import Foundation

enum DefaultAlertType: Int {
    case none
    case successLogin
    case failureLogin
    
}

struct CustomAlertManager {
    var type:DefaultAlertType?
    
    // Success Login
    var successLoginTitle = LocalizedKeys.Login.tittleAlertLoginSuccess
    var successLoginMessage = LocalizedKeys.Login.messageAlertLoginSuccess
    
    // Failure Login
    var failureLoginTittle = LocalizedKeys.Login.tittleAlertLoginFailure
    var failureLoginMessage = LocalizedKeys.Login.messageAlertLoginFailure
    
    // General Tittle Buttons
    var primaryButton = LocalizedKeys.General.generalAccept
    var secondButton = LocalizedKeys.General.generalCancel
    
    init(type: DefaultAlertType) {
        self.type = type
    }
    
}
