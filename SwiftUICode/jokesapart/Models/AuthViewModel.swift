//
//  AuthViewModel.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 27/11/25.
//

import Combine
import FirebaseAuth
import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil

    // Sign in with trimmed email/password
    func signIn(appState: AppState) {
        let emailTrimmed = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordTrimmed = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !emailTrimmed.isEmpty && !passwordTrimmed.isEmpty else {
            self.errorMessage = "Email and Password cannot be empty."
            return
        }
        
        Auth.auth().signIn(withEmail: emailTrimmed, password: passwordTrimmed) { [weak self] result, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
                print("Sign-in error: \(error.localizedDescription)")
                return
            }

            DispatchQueue.main.async {
                self?.errorMessage = nil
                appState.isSignedIn = true // Navigate to HomeView
            }

            print("Signed in successfully")
        }
    }

    // Sign up without immediate sign-out
    func signUp(appState: AppState, completion: @escaping (Bool) -> Void) {
        let emailTrimmed = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordTrimmed = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !emailTrimmed.isEmpty && !passwordTrimmed.isEmpty else {
            self.errorMessage = "Email and Password cannot be empty."
            completion(false)
            return
        }
        
        Auth.auth().createUser(withEmail: emailTrimmed, password: passwordTrimmed) { [weak self] result, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
                print("Sign-up error: \(error.localizedDescription)")
                completion(false)
                return
            }

            DispatchQueue.main.async {
                self?.errorMessage = nil
                appState.didJustCreatedAccount = true
            }

            print("User created successfully")
            completion(true)
        }
    }
}
