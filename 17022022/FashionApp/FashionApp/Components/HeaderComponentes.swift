//
//  HeaderComponentes.swift
//  FashionApp
//
//  Created by Gorka Ormazabal on 19/2/22.
//

import SwiftUI

struct HeaderComponentes: View {
    var body: some View {
        VStack{
        titleView(title: "Header Component")
        subtitleView(subtitle: "Estamos aprendiendo SwiftUI,con Xcode 12 y 13 para mejorar nuestra comprensión del mundo Apple")
        descriptionView(descriptionString: "Estamos con la base dela gestión de subcomponentes que ahce que SwiftUI sea super legor de entender")
        }
    }
    
}

struct titleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .padding(20)
            .font(.title)
            .background(Color.orange)
            .foregroundColor(.black)
            .cornerRadius(20)
    }
}


struct subtitleView: View {
    
    var subtitle: String
    
    var body: some View {
        Text(subtitle)
            .padding(.horizontal,20)
            .font(.title3)
            .foregroundColor(.black)
        
    }
}
struct descriptionView: View {
    
    var descriptionString: String
    
    var body: some View {
        Text(descriptionString)
            .padding([.horizontal,.top],20)
            .font(.callout)
            .foregroundColor(.black)
            .background(Color.orange)
            
        
    }
}


struct HeaderComponentes_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponentes()
    }
}
