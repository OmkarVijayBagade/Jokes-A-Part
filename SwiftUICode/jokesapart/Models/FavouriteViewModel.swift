//
//  FavouriteViewModel.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 29/11/25.
//

import Foundation
import SwiftUI
import Combine

class FavouriteViewModel: ObservableObject{
    @Published var favouriteJokes: [String] = []
    func addToFavourite(_ joke: String) {
        if !favouriteJokes.contains(joke) {
            favouriteJokes.append(joke)
        }
    }
}
