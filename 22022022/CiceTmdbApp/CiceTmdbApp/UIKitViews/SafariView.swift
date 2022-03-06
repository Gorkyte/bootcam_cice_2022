//
//  SafariView.swift
//  CiceTmdbApp
//
//  Created by Gorka Ormazabal on 1/3/22.
//

import Foundation
import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable{
    
    let url: URL
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        return vc
    }
    
}

