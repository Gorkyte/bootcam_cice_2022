//
//  LocalizedKeys.swift
//  CiceMusic
//
//  Created by CICE on 16/02/2022.
//

import Foundation

struct LocalizedKeys {
    
    // GENERAL
    struct General {
        static let generalAccept = "general_accept".localized
        static let generalCancel = "general_cancel".localized
    }
    
    struct Login {
        static let tittleAlertLoginSuccess = "tittle_my_alert_login_success".localized
        static let messageAlertLoginSuccess = "message_my_alert_login_success".localized
        static let tittleAlertLoginFailure = "tittle_my_alert_login_failure".localized
        static let messageAlertLoginFailure = "message_my_alert_login_failure".localized
        
    }
    


    // REGISTRO



    // BUROFAX
 
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
