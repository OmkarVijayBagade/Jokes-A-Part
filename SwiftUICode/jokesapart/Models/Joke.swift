//
//  Joke.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 29/11/25.
//

import Foundation

/// Model returned by the remote API (matches icanhazdadjoke response)
struct APIJoke: Codable {
    let id: String
    let joke: String
    let status: Int?
}

/// Local model used by the app (Identifiable & Codable for local use)
struct Joke: Identifiable, Codable {
    let id: String
    let joke: String
}
