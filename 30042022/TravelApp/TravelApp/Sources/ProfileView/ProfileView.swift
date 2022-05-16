//
//  ProfileView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 16/5/22.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel

    
    var body: some View {
        if self.viewModelSession.userLogged != nil{
            Form{
                Section("Profileko datuak") {
                    Button {
                        self.viewModelSession.logoutSesion()
                    } label: {
                        Text("Irten")
                    }
                    .font(.title3)
                }
            }
        }else {
            ContentView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
