//
//  LoginViewModel.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 15/5/22.
//

import Foundation

enum LoginOption{
    case sessioWithApple
    case emailAndPassword(email: String, password: String)
    
}

enum AuthenticationType: String {
    
    case signIn
    case signUp
    
    var text: String {
        rawValue.capitalized
    }
    
    var fotterText: String {
        switch self {
        case .signIn:
            return "Oraindik ez zera bazkide, Izan  bazkide"
        case .signUp:
            return "Listo zaude bazkide TMDB Apperako bazkide izateko?"
        }
        
    
    }
    
}
