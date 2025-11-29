//
//  JokeCardView.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 29/11/25.
//

import SwiftUI

struct JokeCardView: View {
    @State private var navigateToFavourites = false

    let joke: Joke
    var onShare: (() -> Void)? = nil
    var onFavorite: (() -> Void)? = nil

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.theme.green)
                .frame(width: 380, height: 180)

            VStack {
                HStack {
                    Spacer()
                    HStack(spacing: 16) {
                        Button {
                            onFavorite?()
                        } label: {
                            Image(systemName: "star")
                                .font(.system(size: 22))
                                .foregroundStyle(Color.theme.star)
                        }

                        Button {
                            onShare?()
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 22))
                                .foregroundStyle(Color.theme.white)
                        }
                    }
                    .padding(12)
                }

                Spacer()

                Text(joke.joke)
                    .foregroundColor(.white)
                    .font(.body)
                    .padding()
                    .multilineTextAlignment(.leading)

                Spacer()
            }
            .frame(width: 360, height: 160)
        }
    }
}
