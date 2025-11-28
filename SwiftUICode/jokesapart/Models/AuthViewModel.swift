//
//  AuthViewModel.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 27/11/25.
//

import Combine
import Foundation
import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""

    func signIn(appState: AppState) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                self.errorMessage = error.localizedDescription
                print("Sign-in error: \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                            appState.isSignedIn = true
                        }
        }
    }
}
