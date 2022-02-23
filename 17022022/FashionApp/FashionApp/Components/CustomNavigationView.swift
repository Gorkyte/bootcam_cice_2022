//
//  CustomNavigationView.swift
//  FashionApp
//
//  Created by Gorka Ormazabal on 22/2/22.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @State private var showAlert = false
    @State private var showAlertDos = false
    @Binding var showAlertTres: Bool
    
    var body: some View {
        ZStack {
            Text("Seasons").font(.system(size:20))
            
            HStack (spacing: 8){
                
                // Alerta con Xcode 12
                Button {
                    self.showAlert.toggle()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
                .alert(isPresented: self.$showAlert){
                    Alert(title: Text("Hola soy una Alerta en SwiftUi"),
                          message: Text ("Aqui estamos aprendiendo como se hace una Alerta en SwiftUI"),
                          primaryButton: .default(Text("OK"),
                                                  action: {
                        //Aqui se hacen las acciones
                    }),
                          secondaryButton: .cancel(Text("Cancel"), action: {
                        //Aqui se hacen las acciones
                    }))
                }
                
                Spacer()
                
                // Alerta con Xcode 13
                Button {
                    self.showAlertDos.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .alert("Esta es una segunda Alerta en Xcode 13", isPresented: self.$showAlertDos) {
                    Button("OK"){
                        // Aqui va la acción
                    }
                    Button(role: .cancel) {
                        // Aqui va la acción
                    } label: {
                        Text("Cancel")
                    }

                }
                
                Button {
                    self.showAlertTres.toggle()// Aquí se ejecuta la acción del botón
                } label: {
                    Image(systemName: "alarm")
                }

            }
            
            .padding(.horizontal,8)
            .font(.callout)
            .foregroundColor(.black)
        }
        .background(Color.white)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(showAlertTres: .constant(false))
    }
}
