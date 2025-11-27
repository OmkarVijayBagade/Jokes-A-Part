//
// Favourites.swift
// jokesapart
//
// Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct FavouritesView: View {
    let dummyRows = Array(0..<8)

    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()

            VStack {
                Text("Favourites")
                    .foregroundStyle(Color.theme.darkGreen)
                    .font(Font.custom("IrishGrover-Regular", size: 60))

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(dummyRows, id: \.self) { _ in
                            FavouriteRow()
                        }
                    }
                    .padding(.top, 10)
                }

                
            }
        }
    }
}


#Preview {
    FavouritesView()
}
