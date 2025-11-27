//
//  RootView.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 27/11/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Group {
            if !appState.hasSeenOnboarding {
                OnboardingView()
            } else if !appState.isSignedIn {
                SignInView()
            } else {
                MainView()
            }
        }
    }
}
#Preview {
    RootView()
        .environmentObject(AppState())
}
