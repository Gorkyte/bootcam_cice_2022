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
    case cantSendMail
    case generalConfirmation
    
}

struct CustomAlertManager {
    var type:DefaultAlertType?
    
    // Success Login
    var successLoginTitle = LocalizedKeys.Login.tittleAlertLoginSuccess
    var successLoginMessage = LocalizedKeys.Login.messageAlertLoginSuccess
    
    // Failure Login
    var failureLoginTittle = LocalizedKeys.Login.tittleAlertLoginFailure
    var failureLoginMessage = LocalizedKeys.Login.messageAlertLoginFailure
    
    
    // Success Mail
    var successMailTitle = LocalizedKeys.Mail.tittleAlertMailSuccess
    var successMailMessage = LocalizedKeys.Mail.messageAlertMailSuccess
    
    // Failure Mail
    var failureMailTittle = LocalizedKeys.Mail.tittleAlertMailFailure
    var failureMailMessage = LocalizedKeys.Mail.messageAlertMailFailure
    
    
    // Confirmation
     var confirmationTittle = LocalizedKeys.Confirmation.tittleAlertConfirmation
     var confirmationMessage = LocalizedKeys.Confirmation.messageAlertConfirmation
    
    
    // General Tittle Buttons
    var primaryButton = LocalizedKeys.General.generalAccept
    var secondButton = LocalizedKeys.General.generalCancel
    
    init(type: DefaultAlertType) {
        self.type = type
    }
    
}
