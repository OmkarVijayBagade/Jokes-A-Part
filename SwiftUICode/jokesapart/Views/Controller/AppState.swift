//
//  AppState.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 27/11/25.
//

import Foundation
import SwiftUI
import Combine

final class AppState: ObservableObject {
    @Published var hasSeenOnboarding: Bool = false
    @Published var isSignedIn: Bool = false
}
