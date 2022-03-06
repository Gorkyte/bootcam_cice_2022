//
//  LoginViewModel.swift
//  CiceTmdbApp
//
//  Created by Gorka Ormazabal on 4/3/22.
//

import Foundation

enum LoginOption {
    case sesionWithApple
    case emailAndPassword(email: String, password: String)
    
}
enum AuthenticatyionType: String {
    
    case signIn
    case signUp
    
    var text: String {
        rawValue.capitalized
    }
    
    var footterText: String {
        switch self {
        case .signIn:
            return "Oraindik ez zera kide, eman izena"
        case .signUp:
            return "Listo zaude Cice TMDB App ikusteko?"
        }
    }
    
}
