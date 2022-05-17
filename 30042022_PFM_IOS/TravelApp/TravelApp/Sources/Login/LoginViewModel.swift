//
//  LoginViewModel.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 15/5/22.
//

import Foundation
import FirebaseAuth


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

final class LoginViewModel: ObservableObject {

    @Published var userLogged: User?
    @Published var userAuthenticated = false
    @Published var error: NSError?

    private let autheticationData = Auth.auth()

    required init(){
        userLogged = autheticationData.currentUser
        autheticationData.addStateDidChangeListener(stateAuthenticationModified)
    }

    private func stateAuthenticationModified(with auth: Auth, user: User?){
        guard user != self.userLogged else {return}
        self.userLogged = user
    }

    // SignIn
    func signIn(with loginOption: LoginOption){
        self.userAuthenticated = true
        self.error = nil
        switch loginOption {
        case .sessioWithApple:
            print("Sartu Apple-ekin")
        case .emailAndPassword(let email, let password):
            autheticationData.signIn(withEmail: email,
                                     password: password,
                                     completion: handlerAuthenticationState)

        }
    }

    // SignUp
    func signUp(email: String, password: String, passwordConfirmation: String){
        guard password == passwordConfirmation else {
            self.error = NSError(domain: "", code: 9210, userInfo: [NSLocalizedDescriptionKey: "Pasahitza eta konfirmazioa ez dira berdinak"])
            return
        }
        self.userAuthenticated = true
        self.error = nil
        autheticationData.createUser(withEmail: email,
                                      password: password,
                                      completion: handlerAuthenticationState)
    }

    // Logout
    func logoutSesion() {
        do {
            try autheticationData.signOut()
        } catch{
            self.error = NSError(domain: "", code: 9999, userInfo: [NSLocalizedDescriptionKey: "Erabiltzaileak ez du lortu saioa ixten"])
        }

    }


    // Handler
    private func handlerAuthenticationState(with auth: AuthDataResult?, and error: Error?){
        DispatchQueue.main.async {
            self.userAuthenticated = false
            if let user = auth?.user{
                self.userLogged = user
            } else if let errorUnw = error {
                self.error = errorUnw as NSError
            }
        }
    }
}
