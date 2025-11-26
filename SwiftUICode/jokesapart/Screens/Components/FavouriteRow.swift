//
// FavouritesRow.swift
// jokesapart
//
// Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct FavouriteRow: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 100)
                .shadow(
                    color: Color.black.opacity(0.1),
                    radius: 5,
                    x: 0,
                    y: 5
                )
            
            Text("-----------")
                .foregroundStyle(Color.gray.opacity(0.7))
                .font(.custom("Instrumental-Regular", size: 30))
        }
    }
}

#Preview {
    FavouriteRow()
}
