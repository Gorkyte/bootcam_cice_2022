//
//  SafariView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 12/5/22.
//

import Foundation
import SwiftUI
import SafariServices

// Controlador de vista en UIkit
struct SafariView: UIViewControllerRepresentable{
    
    let url: URL
    
    // El que acctualiza la vista
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
    
    // Construye el controlador
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        return vc
    }
    
    
}

