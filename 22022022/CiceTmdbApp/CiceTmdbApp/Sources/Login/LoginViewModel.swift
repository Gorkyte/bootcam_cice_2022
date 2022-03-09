//
//  LoginViewModel.swift
//  CiceTmdbApp
//
//  Created by Gorka Ormazabal on 4/3/22.
//

import Foundation
import FirebaseAuth

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
            return "Oraindik ez zera kide? eman izena"
        case .signUp:
            return "Listo al zaude Cice TMDB App ikusteko?"
        }
    }
    
}


final class LoginViewModel: ObservableObject {
    
    @Published var userLogged: User?
    @Published var userAuthenticated = false
    @Published var error: NSError?
    
    private let authenticationData = Auth.auth()
    
    required init() {
        userLogged = authenticationData.currentUser
        authenticationData.addStateDidChangeListener(stateAuthenticationModified)
    }
    
    private func stateAuthenticationModified(with auth: Auth, user: User?){
        guard user != self.userLogged else { return }
        self.userLogged = user
        
    }
    
    // Login > SigIn
    func sigIn (with loginOption: LoginOption) {
        self.userAuthenticated = true
        self.error = nil
        switch loginOption {
        case .sesionWithApple:
            print("Login con Apple")
        case let .emailAndPassword(email, password):
            authenticationData.signIn(withEmail: email,
                                      password: password,
                                      completion: handlerAuthenticationState)
        }
    }
    
    // Login > SigUp
    func signUp (email: String, password: String, passwordConfirmation: String){
        guard password == passwordConfirmation else {
            self.error = NSError(domain: "", code: 9210, userInfo: [NSLocalizedDescriptionKey: "La password y la confirmación no son iguales"])
            return
        }
        self.userAuthenticated = true
        self.error = nil
        authenticationData.createUser(withEmail: email,
                                      password: password,
                                      completion: handlerAuthenticationState)
    }
    
    // Logout
    func logoutSession(){
        do {
            try authenticationData.signOut()
            
        } catch{
            self.error = NSError(domain: "", code: 9999, userInfo: [NSLocalizedDescriptionKey: "El ususario no ha logrado cerrar la sesión"])
        }
    }
    
    
    
    // Handler
    private func handlerAuthenticationState(with auth: AuthDataResult?, and error: Error?) {
        DispatchQueue.main.async {
            self.userAuthenticated = false
            if let user = auth?.user {
                self.userLogged = user
            } else if let errorUnw = error {
                self.error = errorUnw as NSError
            }
        }
    }
    
}
