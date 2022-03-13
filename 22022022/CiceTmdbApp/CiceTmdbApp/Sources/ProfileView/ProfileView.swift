//
//  ProfileView.swift
//  CiceTmdbApp
//
//  Created by Gorka Ormazabal on 6/3/22.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        if self.viewModelSession.userLogged != nil {
            Form{
                Section("Profile data"){
                    Button {
                        self.viewModelSession.logoutSession()
                    } label: {
                        Text("Logout")
                            //.buttonStyleH1()
                    }
                    .buttonStyleH1()
                    
                    
                    Section("Profile data"){
                        Button {
                            self.viewModelSession.logoutSession()
                        } label: {
                            Text("Logout")
                                //.buttonStyleH1()
                        }
                        .buttonStyleH1()
                    
                    
                    
                    
                    
                    
                }
            }
            
            
            
        } else {
            ContentView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
