//
//  BottomNavBar.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct BottomNavBar: View {
    var activeIndex: Int = 0
    var action: ((Int) -> Void)?

    var body: some View {
        HStack(spacing: 24) {
            navButton("house.fill", 0)
            navButton("square.stack.fill", 1)
            navButton("info.circle", 2)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color.theme.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color.theme.darkGreen.opacity(0.15), radius: 8, y: 4)
    }

    @ViewBuilder
    private func navButton(_ icon: String, _ index: Int) -> some View {
        Button {
            action?(index)
        } label: {
            Image(systemName: icon)
                .font(.system(size: 24, weight: .bold))
                .frame(width: 55, height: 45)
                .background(activeIndex == index ? Color.theme.green : Color.clear)
                .foregroundStyle(activeIndex == index ? Color.theme.white : Color.theme.darkGreen)
                .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }
}

#Preview {
    BottomNavBar()
}
