//
//  ContentView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 30/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1

    
    
    var body: some View {
        VStack{
            
            //HomeView()
            
            if currentPage > Constants.totalPages {
                //HomeView()
                LoginView(authType: .signIn)
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
