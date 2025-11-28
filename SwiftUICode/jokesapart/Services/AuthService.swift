//
//  AuthService.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 28/11/25.
//

import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
