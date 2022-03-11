//
//  ContactosApp.swift
//  Contactos
//
//  Created by Gorka Ormazabal on 10/3/22.
//

import SwiftUI

@main
struct ContactosApp: App {
    
    let persistanceVM = PersistanceViewModel.shared
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceVM.container.viewContext)
        }
    }
}
