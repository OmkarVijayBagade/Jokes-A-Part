//
//  JokeService.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 29/11/25.
//

import Foundation
import Combine

final class JokeService: ObservableObject {
    @Published var currentJoke: String = "Loading joke..."

    private let endpoint = "https://icanhazdadjoke.com/"

    func fetchJoke() {
        guard let url = URL(string: endpoint) else {
            print("❌ Invalid URL for joke endpoint")
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"

        print("📤 Fetching single joke...")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.currentJoke = "Failed to load joke."
                }
                return
            }

            if let http = response as? HTTPURLResponse {
                print("📦 HTTP status: \(http.statusCode)")
            }

            guard let data = data else {
                print("❌ No data received")
                DispatchQueue.main.async {
                    self.currentJoke = "No data."
                }
                return
            }

            do {
                let apiJoke = try JSONDecoder().decode(APIJoke.self, from: data)
                DispatchQueue.main.async {
                    self.currentJoke = apiJoke.joke
                    print("😂 Received joke: \(apiJoke.joke)")
                }
            } catch {
                print("❌ Decoding error: \(error.localizedDescription)")
                // Try to decode as a very simple object if API shape differs
                if let str = String(data: data, encoding: .utf8) {
                    print("Raw response: \(str)")
                }
                DispatchQueue.main.async {
                    self.currentJoke = "Decoding failed."
                }
            }
        }.resume()
    }

    /// Fetch multiple jokes (calls the single endpoint `count` times).
    /// Calls completion on main thread with array of `Joke`.
    func fetchMultiple(count: Int, completion: @escaping ([Joke]) -> Void) {
        guard count > 0 else { completion([]); return }

        var results: [Joke] = []
        let group = DispatchGroup()

        for _ in 0..<count {
            group.enter()
            guard let url = URL(string: endpoint) else {
                group.leave()
                continue
            }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            URLSession.shared.dataTask(with: request) { data, _, error in
                defer { group.leave() }
                if let data = data, let apiJoke = try? JSONDecoder().decode(APIJoke.self, from: data) {
                    results.append(Joke(id: apiJoke.id, joke: apiJoke.joke))
                } else {
                    // fallback dummy joke if something fails
                    results.append(Joke(id: UUID().uuidString, joke: "Could not fetch joke."))
                }
            }.resume()
        }

        group.notify(queue: .main) {
            completion(results)
        }
    }
}
