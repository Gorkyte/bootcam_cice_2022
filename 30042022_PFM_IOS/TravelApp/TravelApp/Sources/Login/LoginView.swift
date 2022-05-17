//
//  LoginView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 15/5/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    @State var authType: AuthenticationType
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmationPassword: String = ""
    @State var showPassword = false
    
    
    var body: some View {
        ZStack{
            
            VStack (spacing: 40){
                
                //Text("hello")
                
                helloApp
                imageAppLogo
                
                // Haremos una comprobación para saber si el usuario está autenticado en Firebase
                if !self.viewModelSession.userAuthenticated {
                //if true{
                    VStack(spacing: 20){
                        CustomTextField(placeholder: "Posta elektronikoa",
                                        title: "Posta elektronikoa",
                                        text: self.$email)
                            .textfieldStyle()// Estilo de casilla
//                            .padding(10)
//                            .background(
//                                Color(red: 239/255,
//                                      green: 243/255,
//                                      blue: 244/255,
//                                      opacity: 1)
//                            )
//                            .cornerRadius(10)
//                            .shadow(color: Color.gray.opacity(0.3),radius: 10, x:5, y:5)
                        
                        if self.showPassword {
                            CustomTextField(placeholder: "Pasahitza",
                                            title: "Pasahitza",
                                            text: self.$password)
                            .textfieldStyle()
                        }else{
                            CustomSecureTextField(placeholder: "Pasahitza",
                                                  title: "Pasahitza",
                                                  text: self.$password)
                            .textfieldStyle() // Estilo de casilla
                            
                        }
                        
                        if authType == .signUp{
                            if showPassword {
                                CustomTextField(placeholder: "Pasahitza konfirmatu",
                                                title: "Pasahitza konfirmatu",
                                                text: self.$confirmationPassword)
                                .textfieldStyle()// Estilo de casilla
                            }
                            else {
                                CustomSecureTextField(placeholder: "Pasahitza konfirmatu",
                                                      title: "Pasahitza konfirmatu",
                                                      text: self.$confirmationPassword)
                                .textfieldStyle()
                            }
                        }
                     
                        
                        
                        Toggle("Erakutxi pasahitza", isOn: self.$showPassword)
                            .padding()
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        
                        //BOTON DE LOGIN / REGISTRO
                        Button {
                            self.authEmailTouched()
                        } label: {
                            //Text("Sartu")
                            Text(self.authType.text)
                                .buttonStyleH1() // Estilo para botón
//                                .font(.headline)
//                                .lineLimit(2)
//                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
//                                .background(
//                                    Color(red: 239/255, green: 255, blue: 244/255)
//                                )
//                                .clipShape(Capsule())

                        }
                        .foregroundColor(.gray)
                        .padding()


                        //BOTON DE cambio de formulario si no estoy logado
                        Button {
                            self.footerTouched()
                        } label: {
                            //Text("Oraindik ez zera bazkide? ")
                            Text(self.authType.fotterText)
                                .buttonStyleH1() // Estilo para botón
//                                .font(.headline)
//                                .lineLimit(2)
//                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
//                                .background(
//                                    Color(red: 239/255, green: 255, blue: 244/255)
//                                )
//                                .clipShape(Capsule())
                        }
                        .foregroundColor(.gray)
                        .padding()

             
                    }
                }
            }
            .padding()
        }
        //.background(Color.green)
        
                
    }
    
    var helloApp: some View {
        Text("TMDB App")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .foregroundColor(.green)
        
    }
    
    var imageAppLogo: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 20)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.3),radius: 10, x:5, y:5)
            .overlay(
            Circle()
                .stroke(Color.green, lineWidth: 10)
            
            
            )
    }
    
    private func authEmailTouched(){
        switch authType {
        case .signIn:
            self.viewModelSession.signIn(with: .emailAndPassword(email: self.email, password: self.password))
        case .signUp:
            self.viewModelSession.signUp(email: self.email, password: self.password, passwordConfirmation: self.confirmationPassword)
        }
    }

    private func footerTouched(){
        self.authType = authType == .signUp ? .signIn : .signUp
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        //LoginView(authType: .signIn)
        LoginView(authType: .signIn)
    }
}

