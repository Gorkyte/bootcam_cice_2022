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
    
    @State private var showCustomAlertView = false
    @State private var showActionSheet = false
    @State private var showAlert = false
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    headerInformation
                    bodyInformation
                    
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            
            if showCustomAlertView{
                CustomAlertView(title: "Enhorabuena!",
                                message: "Tu selección se ha añadido al carrito de compras",
                                hideCustomAlertView: self.$showCustomAlertView)
                    .animation(.easeInOut, value: self.showCustomAlertView)
            }
            
        }
        
        
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
                        self.presenterMode.wrappedValue.dismiss() // Aquí va la acción
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                    .padding([.leading, .top],10)
                    
                    
                    //=======================================Botón 2 "lupa"
                    Button {
                        self.showAlert.toggle()// Aquí va la acción
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .offset(x: proxy.size.width - 80, y: 25)
                    
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
                    //=======================================Botón 3 "carrito"
                    Button {
                        self.showActionSheet.toggle() // Aquí va la acción
                    } label: {
                        Image(systemName: "cart")
                    }
                    .offset(x: proxy.size.width - 40, y: 25)
                    
                    .actionSheet(isPresented: self.$showActionSheet) {
                        ActionSheet(title: Text("A question"), message: Text("Are you sure about that?"), buttons: [
                            .default(Text("Yes")) { /* Pressed button Yes. Do Something */ },
                            .default(Text("No")) { /* Pressed button No. Do Something */ },
                            .default(Text("Maybe")) { /* Pressed button Maybe. Do Something */ },
                            .destructive(Text("Delete")) { /* Pressed button Delete. Do Something */ },
                            .cancel() { /* Pressed button Cancel. Do Something */ }
                        ])
                            
                        
                    }
                  
                    
                    
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
                //=======================================Botón 1 "Add to Cart"
                Button {
                    // Aquí va la acción
                } label: {
                    Text("Add to cart")
                        .padding()
                        .border(Color.black, width: 1.5)
                }
                .foregroundColor(.black)
                
                Spacer()
                
                //=======================================Botón 2 "Buy now"
                Button {
                    self.showCustomAlertView.toggle()  // Aquí va la acción
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
