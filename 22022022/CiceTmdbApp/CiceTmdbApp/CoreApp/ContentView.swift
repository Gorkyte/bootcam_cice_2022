//
//  ContentView.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 22/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    
    
    var body: some View {
        VStack{
            
            
            //===============Aquí metemos el OnBoardingView
            
            if currentPage > Constants.totalPages {
                
                if self.viewModelSession.userLogged != nil {
                    HomeView()                      // Si estás Logado, vas a la Home
                } else {
                    LoginView(authType: .signUp)    // Si no estás logado, entras aquí
                }
                
            } else {
                OnBoardingView()
            }
           
            //===============Aquí metemos el OnBoardingView
            //HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
