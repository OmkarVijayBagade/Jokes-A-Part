//
//  BottomNavBar.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct BottomNavBar: View {
    var activeIndex: Int = 0
    var action: ((Int) -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 30) {
            navButton(icon: "house.fill", index: 0)
            navButton(icon: "square.stack.fill", index: 1)
            navButton(icon: "info.circle", index: 2)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 25)
    }
    
    @ViewBuilder
    private func navButton(icon: String, index: Int) -> some View {
        Button(action: {
            action?(index)
        }) {
            Image(systemName: icon)
                .font(.system(size: 36))
                .frame(width: 80, height: 55)
                .background(activeIndex == index ? Color.theme.green : Color.theme.white)
                .foregroundStyle(activeIndex == index ? Color.theme.white : Color.theme.darkGreen)
                .clipShape(RoundedRectangle(cornerRadius: 35))
                .shadow(color: Color.theme.darkGreen, radius: activeIndex == index ? 0 : 3)
        }
    }
}

struct BottomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavBar()
    }
}
