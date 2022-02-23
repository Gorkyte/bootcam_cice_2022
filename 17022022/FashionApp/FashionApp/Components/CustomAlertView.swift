//
//  CustomAlertView.swift
//  FashionApp
//
//  Created by Gorka Ormazabal on 22/2/22.
//

import SwiftUI

struct CustomAlertView: View {
    
    var title: String
    var message: String
    @Binding var hideCustomAlertView: Bool    
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20){
                HStack{
                    Spacer()
                    Text(title)
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button{
                        // Aquí va la acción del Binding
                        self.hideCustomAlertView.toggle()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                Divider()
                Text(message)
                    .font(.custom("Arial", size: 18))
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.90)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(title: "Aquí Gorka",
                        message: "Aprendiendo a crear una alerta personalizada",
                        hideCustomAlertView: .constant(true))
    }
}
