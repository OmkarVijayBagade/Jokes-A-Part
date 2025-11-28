//
//  AppState.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 27/11/25.
//
import Foundation
import Combine
import FirebaseAuth

final class AppState: ObservableObject {
    @Published var hasSeenOnboarding: Bool = false
    @Published var isSignedIn: Bool = false
    @Published var didJustCreatedAccount: Bool = false

    private var authListener: AuthStateDidChangeListenerHandle?

    init() {
        listenToAuthChanges()
    }

    func listenToAuthChanges() {
        authListener = Auth.auth().addStateDidChangeListener { _, user in
            DispatchQueue.main.async {
                self.isSignedIn = (user != nil)
            }
        }
    }
}
