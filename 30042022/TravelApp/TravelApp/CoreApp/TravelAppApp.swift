//
//  TravelAppApp.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 30/4/22.
//

import SwiftUI
import FirebaseCore

@main
struct TravelAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LoginViewModel())
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
        
    }
}
