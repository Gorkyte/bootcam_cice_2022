//
//  DetailFashionView.swift
//  FashionApp
//
//  Created by Gorka Ormazabal on 23/2/22.
//

import SwiftUI

struct DetailFashionView: View {
    
    var model: Row
    @State private var mySize = ""
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    
    var body: some View {
        ScrollView{
            VStack{
                headerInformation
                bodyInformation
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    var headerInformation: some View {
        ZStack(alignment: .topLeading){
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack{
                //  GeometryReader, es un contenedor que es capaz de leer la pantalla principal
                //  para dejar de usar Spacer, reajusta solo (con el proxy in)
                GeometryReader{ proxy in
                    //=======================================Botón 1 "<"
                    Button {
                        self.presenterMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                    .padding([.leading, .top],10)
                    
                    //=======================================Botón 2 "lupa"
                    Button {
                        // Aquí va la acción
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .offset(x: proxy.size.width - 80, y: 25)
                    //=======================================Botón 3 "carrito"
                    Button {
                        // Aquí va la acción
                    } label: {
                        Image(systemName: "cart")
                    }
                    .offset(x: proxy.size.width - 40, y: 25)
                }
            }
            .foregroundColor(.black)
        }
    }
    
    var bodyInformation: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                VStack{
                    Text(model.name)
                        .font(.largeTitle)
                    Text(model.price)
                        .fontWeight(.heavy)
                }
                Spacer()
                HStack(spacing: 20) {
                    Circle().fill(Color.red).frame(width: 20, height: 20)
                    Circle().fill(Color.green).frame(width: 20, height: 20)
                    Circle().fill(Color.blue).frame(width: 20, height: 20)
                }
            }
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                .font(.headline)
            
            Text("Select Size")
                .font(.largeTitle)
            HStack{
                ForEach(customSize, id: \.self){ item in
                    Button {
                        self.mySize = item
                    } label: {
                        Text (item)
                            .padding()
                            .border(Color.black, width: self.mySize == item ? 1.5 : 0)
                    }
                    .foregroundColor(.black)
                }
            }
            
            HStack{
                Button {
                    // Aquí va la acción
                } label: {
                    Text("Add to cart")
                        .padding()
                        .border(Color.black, width: 1.5)
                }
                .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    // Aquí va la acción
                } label: {
                    Text("Buy now")
                        .padding()
                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
                
                
            }
            
        }
        .padding()
        .background(
            roudedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -30)
            )
        .padding(.top, -40)
    }
    
}

struct roudedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}


struct DetailFashionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFashionView(model: Row(id: 0,
                                     name: "Summer and Flares",
                                     image: "p1",
                                     price: "199€"))
    }
}
