//
//  jokesapartApp.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI
import FirebaseCore
import Firebase



@main
struct jokesapartApp: App {
    @StateObject private var appState = AppState()
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
        }
        
    }
}
