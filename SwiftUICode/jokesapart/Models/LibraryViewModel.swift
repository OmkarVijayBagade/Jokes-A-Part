//
//  LibraryViewModel.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 29/11/25.
//

import Foundation
import Combine

final class LibraryViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    private var isLoading = false
    private let service = JokeService()

    func fetchMoreJokes() {
        guard !isLoading else { return }
        isLoading = true
        print("📩 Fetching more Jokes.....")

        service.fetchMultiple(count: 5) { newJokes in
            self.jokes.append(contentsOf: newJokes)
            self.isLoading = false
            print("✅ Added: \(newJokes.count) jokes. Total: \(self.jokes.count)")
        }
    }
}
