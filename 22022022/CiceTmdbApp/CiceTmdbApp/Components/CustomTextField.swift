//
//  CustomTextField.swift
//  CiceTmdbApp
//
//  Created by Gorka Ormazabal on 4/3/22.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: String
    var title: String
    var text: Binding<String>
    //@Binding var text: String // Este es igual que el de arriba
    
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        HStack{
            Image(systemName: "person")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                TextField(placeholder, text: text)
                    .foregroundColor(.black)
            }
            .padding(.top, 15)
            // aqui se mete una animación chula para que si escribes el mail, sube arriba
            .animation(.spring(response: 0.2,
                               dampingFraction: 0.5,
                               blendDuration: 0.3),
                       value: text.wrappedValue.isEmpty)
        }
    }
}

struct CustomSecureTextField: View {
    var placeholder: String
    var title: String
    var text: Binding<String>
    
    var body: some View {
        
        HStack{
            Image(systemName: "lock")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                SecureField(placeholder, text: text)
                    .foregroundColor(.black)
            }
            .padding(.top, 15)
            // aqui se mete una animación chula para que si escribes el mail, sube arriba
            .animation(.spring(response: 0.2,
                               dampingFraction: 0.5,
                               blendDuration: 0.3),
                       value: text.wrappedValue.isEmpty)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureTextField(placeholder: "email",
                        title: "email",
                        text: .constant("email@email.com"))
    }
}
