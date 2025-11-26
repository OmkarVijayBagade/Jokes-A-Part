//
// Profile.swift
// jokesapart
//
// Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()
            
            VStack {
                Text("Profile")
                    .font(Font.custom("IrishGrover-Regular", size: 80))
                
                ZStack {
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 5, dash: [20, 30]))
                        .frame(width: 185, height: 185)
                    
                    Circle()
                        .fill(Color.theme.green)
                        .frame(width: 175, height: 175)
                        .overlay(
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .scaledToFit()
                        )
                }
                
                Spacer().frame(height: 40)
                
                Rectangle()
                    .fill(Color.theme.darkGreen)
                    .frame(width: 300, height: 1)
                
                VStack(alignment: .leading) {
                    // username
                    VStack(alignment: .leading) {
                        Text("Username:")
                            .font(Font.custom("IrishGrover-Regular", size: 40))
                        
                        Text("Omkar Bagade")
                            .font(Font.custom("InriaSans-Regular", size: 25))
                    }
                    
                    Spacer().frame(height: 10)
                    
                    // email
                    VStack(alignment: .leading) {
                        Text("Email:")
                            .font(Font.custom("IrishGrover-Regular", size: 40))
                        
                        Text("omkarbagade16@gmail.com")
                            .font(Font.custom("InriaSans-Regular", size: 25))
                    }
                }
                
                Spacer()
                
                // Button
                Button(action: {}) {
                    HStack {
                        Text("Log Out")
                            .foregroundStyle(Color.theme.white)
                            .frame(width: 148, height: 35)
                            .font(Font.custom("IrishGrover-Regular", size: 30))
                    }
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                .shadow(color: Color.red, radius: 10, y: 4)
                .offset(y: 20)
                
                Spacer().frame(height: 60)
                
                // Note: .foregroundStyle applied here affects all views above it in the VStack
                .foregroundStyle(Color.theme.darkGreen)
                
                // Bottom navbar
                BottomNavBar(activeIndex: 0) { index in
                    print("Tapped nav index: \(index)")
                }
                .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    Profile()
}
