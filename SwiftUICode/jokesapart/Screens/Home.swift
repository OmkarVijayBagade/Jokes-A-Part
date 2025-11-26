//
//  Home.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top image
                Image("HomeScreenImage")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 350)
                    .offset(y: -60)
                    .ignoresSafeArea()
                Spacer()
            }
            
            VStack {
                ZStack(alignment: .top) {
                    CurvedTopShape()
                        .fill(Color.theme.white)
                        .frame(height: 500)

                    VStack(spacing: 20) {
                        // Profile image
                        ZStack {
                            Circle()
                                .fill(Color.theme.inputField)
                                .frame(width: 130, height: 130)
                                .shadow(radius: 4)
                                .overlay(
                                    ZStack {
                                        Circle()
                                            .fill(Color.theme.white)
                                            .frame(width: 130, height: 130)
                                        Circle()
                                            .stroke(style: StrokeStyle(lineWidth: 4))
                                            .foregroundStyle(Color.theme.green)
                                            .shadow(color: Color.theme.green, radius: 10, y: 4)
                                    }
                                )

                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .foregroundStyle(Color.theme.darkGreen)
                        }
                        .offset(y: -60)
                        .padding(.bottom, -50)

                        Text("Username")
                            .foregroundStyle(Color.theme.darkGreen)
                            .font(Font.custom("IrishGrover-Regular", size: 60))

                        Text("Todays Joke")
                            .foregroundStyle(Color.theme.darkGreen)
                            .font(Font.custom("InstrumentSerif-Regular", size: 40))

                        Text("\"Decided to go to a Italian restaurant kyunki woh gharke PASTA.\"")
                            .frame(width: 286, height: 150)
                            .font(Font.custom("InstrumentSerif-Regular", size: 30))

                        // Refresh Button
                        Button(action: {}) {
                            Text("Refresh")
                                .foregroundStyle(Color.theme.white)
                                .font(Font.custom("IrishGrover-Regular", size: 30))
                                .frame(width: 200, height: 50)
                                .background(Color.theme.green)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                        }
                        .shadow(color: Color.theme.darkGreen, radius: 10, y: 4)
                    }
                    .padding(.top, 5)
                }
            }
            
            Spacer().frame(height: 60)

            // Bottom navbar
            BottomNavBar(activeIndex: 0) { index in
                print("Tapped nav index: \(index)")
            }
            .padding(.bottom, 20)
        }
    }

    struct CurvedTopShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 80))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: 80), control: CGPoint(x: rect.width / 2, y: -80))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.closeSubpath()
            
            return path
        }
    }
}

#Preview {
    Home()
}
