//
//  ContentView.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 22/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack{
            
            
            //===============Aquí metemos el OnBoardingView
            
            if currentPage > Constants.totalPages {
                HomeView()
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
