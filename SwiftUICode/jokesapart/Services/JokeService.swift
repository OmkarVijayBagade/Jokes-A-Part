//
//  JokeService.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 29/11/25.
//

import Foundation
import SwiftUI
import Combine

class JokeService: ObservableObject {

    @Published var currentJoke: String = "Loading joke..."

    func fetchJoke() {
        guard let url = URL(string: "https://icanhazdadjoke.com/") else {
            print("❌ Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                        print("❌ Error: \(error.localizedDescription)")
                        return
                    }

                    print("📦 Got response: \(response.debugDescription)")
            
            if let data = data {
                if let decoded = try? JSONDecoder().decode(
                    Joke.self,
                    from: data
                ) {
                    DispatchQueue.main.async {
                        self.currentJoke = decoded.joke
                        print("😂 Updated joke: \(decoded.joke)")
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Unknown error/Decoding Failed.")
            }
        }.resume()
    }
}
