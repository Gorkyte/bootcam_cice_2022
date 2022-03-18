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
    var imageURL: URL
    
    @Binding var hideCustomAlertView: Bool
    @ObservedObject var imageLoaderViewModel = ImageLoader()
    
    init(title: String ,
         message: String,
         imageURL: URL,
         hideCustomAlertView: Binding<Bool>){
        self.title = title
        self.message = message
        self.imageURL = imageURL
        self.hideCustomAlertView = hideCustomAlertView
            
        self.imageLoaderViewModel.loadImage(whit: self.imageURL)

    }
    
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
            
            if self.imageLoaderViewModel.image != nil{
                Image(uiImage: self.imageLoaderViewModel.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.red, lineWidth: 1)
                    )
                    .loader(state: .ok)
            }else{
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]),
                                         startPoint: .bottom,
                                         endPoint: .top))
                    .clipShape(Circle())
                    .loader(state: .loading)
            }
            
            
            
            
            
        }
    }
}
