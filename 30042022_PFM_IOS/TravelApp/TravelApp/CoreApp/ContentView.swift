//
//  ContentView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 30/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    @EnvironmentObject var viewModelSession: LoginViewModel
    
    
    var body: some View {
        VStack{
            
            //HomeView()
            
            if currentPage > Constants.totalPages {
                if self.viewModelSession.userLogged != nil{
                    HomeView()
                } else {
                    LoginView(authType: .signUp)
                }
                
            } else {
                OnboardingView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
