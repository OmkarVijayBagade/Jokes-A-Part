//
//  AuthViewModel.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 27/11/25.
//

import Foundation
import Combine
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var email: String = "omkar@gmail.com"
    @Published var password: String = "1234"
    
    func signIn(appState: AppState) {
        // Fake sign in logic
        // In real app, call backend or Firebase auth here.
        if !email.isEmpty && !password.isEmpty {
            appState.isSignedIn = true
        } else {
            print("Enter details first")
        }
    }
}
