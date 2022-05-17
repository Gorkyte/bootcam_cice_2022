//
//  OnboardingView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 15/5/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        
        ZStack{
            if currentPage == 1 {
                ScreenView(image: "lottie1",
                           title: "1 Pausua",
                           detail: "Ongietorri Pelikula eta Telesailen Appera, 1 Pausua",
                           bgColor: Color.white)
                .transition(.scale)
            }
            if currentPage == 2 {
                ScreenView(image: "lottie2",
                           title: "2 Pausua",
                           detail: "Ongietorri Pelikula eta Telesailen Appera, 2 Pausua",
                           bgColor: Color.white)
                .transition(.scale)
            }
            if currentPage == 3 {
                ScreenView(image: "lottie3",
                           title: "3 Pausua",
                           detail: "Ongietorri Pelikula eta Telesailen Appera, 3 Pausua",
                           bgColor: Color.white)
                .transition(.scale)
            }
        }
        .overlay(
            Button(action: {
                // Aquí cambiamos de pagina
                withAnimation(.easeInOut){
                    if currentPage <= Constants.totalPages{
                        currentPage += 1
                    } else {
                        currentPage = 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                    .frame(width: 50, height: 50)
                    .background(Color.gray)
                    .clipShape(Circle())
                    .overlay(
                        ZStack{
                            Circle()
                                .stroke(Color.black.opacity(0.2), lineWidth: 2)
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(Constants.totalPages))
                                .stroke(Color.green, lineWidth: 10)
                                .rotationEffect(.degrees(-90))
                                                   
                        }
                            .padding(-15)
                    )
            }) .padding(.bottom, 10),
            
            alignment: .bottom
            
            )
        
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1

    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                if currentPage == 1{
                    Text("Ongietorri CiceTMDB Appera")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4) //  Separador entre letras
                }else {
                    Button {
                        withAnimation (.easeInOut){
                            currentPage -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                    }

                }
                Spacer()
                
                Button {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                } label: {
                    Text("Irten")
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }
     
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            Text(detail)
                .fontWeight(.semibold)
                .kerning(1.4)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .background(bgColor.ignoresSafeArea())
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
