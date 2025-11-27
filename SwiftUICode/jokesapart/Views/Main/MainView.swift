//
//  MainView.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 27/11/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {

            if !appState.hasSeenOnboarding {
                OnboardingView()
            } else if !appState.isSignedIn {
                SignInView()
            } else {
                currentScreen

                BottomNavBar(activeIndex: selectedTab) { index in
                    withAnimation(.easeInOut) {
                        selectedTab = index
                    }
                }
                .padding(.bottom, 8)
            }
        }
        .animation(.easeInOut, value: appState.hasSeenOnboarding)
        .animation(.easeInOut, value: appState.isSignedIn)
    }

    @ViewBuilder
    private var currentScreen: some View {
        switch selectedTab {
        case 0: HomeView()
        case 1: LibraryView()
        case 2: AboutView()
        default: HomeView()
        }
    }
}

#Preview {
    MainView()
}
