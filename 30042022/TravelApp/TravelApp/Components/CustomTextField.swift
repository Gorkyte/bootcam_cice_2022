//
//  CustomTextField.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 15/5/22.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: String
    var title: String
    var text: Binding<String>
    //@Binding var text: String // este es igual que el de arriba
    
    
    var body: some View {
        HStack{
            Image(systemName: "person.circle")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                TextField(placeholder, text: text)
                    .foregroundColor(.black)
            }
            .padding(.top)
            .animation(.spring(response: 0.2, // hace como un efecto de rebote muy bonito
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
            Image(systemName: "lock.circle")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                SecureField(placeholder, text: text)
                    .foregroundColor(.black)
            }
            .padding(.top)
            .animation(.spring(response: 0.2, // hace como un efecto de rebote muy bonito
                               dampingFraction: 0.5,
                               blendDuration: 0.3),
                       value: text.wrappedValue.isEmpty)
        }
    }
    
    
}


struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField( placeholder: "email",
                         title: "email",
                         text: .constant("email@email.com")
        
        )
    }
}
