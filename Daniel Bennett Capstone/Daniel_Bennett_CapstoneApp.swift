//
//  Daniel_Bennett_CapstoneApp.swift
//  Daniel Bennett Capstone
//
//  Created by Danny Bennett on 4/30/22.
//

import SwiftUI
import Firebase

@main
struct Daniel_Bennett_CapstoneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
                .accentColor(.white)
        }
    }
}
