//
//  ButtonModifier.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 17/5/22.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .lineLimit(2)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
            .background(
                Color(red: 239/255, green: 255, blue: 244/255)
            )
            .clipShape(Capsule())
    }
}


extension View {
    func buttonStyleH1() -> some View {
        self.modifier(ButtonModifier())
    }
}



