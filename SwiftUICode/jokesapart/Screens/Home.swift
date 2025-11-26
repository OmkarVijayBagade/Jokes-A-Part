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
                //top image
                Image("HomeScreenImage")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 350)
                    .offset(y: -10)
                    .ignoresSafeArea()
                    .offset(y: -50)
                Spacer()
            }
            VStack {
                ZStack(alignment: .top) {
                    CurvedTopShape()
                        .fill(Color.theme.white)
                        .frame(height: 500)

                    VStack(spacing: 20) {
                        //pofile image
                        ZStack {
                            Circle()
                                .fill(Color.theme.inputField)
                                .frame(width: 130, height: 130)
                                .shadow(radius: 4)
                                .overlay(
                                    Circle()
                                        .fill(Color.theme.darkGreen)
                                        .frame(width: 130,height:130)
                                )
                                .foregroundStyle(Color.theme.darkGreen)

                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .foregroundStyle(Color.theme.white)
                        }
                        .offset(y:-60)
                        .padding(.bottom,-50)
                        
                        Text("Username")
                            .foregroundStyle(Color.theme.darkGreen)
                            .font(Font.custom("IrishGrover-Regular", size: 60))
                        
                        Text("Todays Joke")
                            .foregroundStyle(Color.theme.darkGreen)
                            .font(Font.custom("InstrumentSerif-Regular", size: 40))
                        
                        Text("\"Decided to go to a Italian restaurant kyunki woh gharke PASTA.\"")
                            .frame(width: 286,height:150)
                            .font(Font.custom("InstrumentSerif-Regular", size: 30))
                    }
                }
            }
        }
    }

}

struct CurvedTopShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        //start bottom left
        path.move(to: CGPoint(x: 0, y: rect.height))

        //line to top left
        path.addLine(to: CGPoint(x: 0, y: 80))

        //big curve across top
        path.addQuadCurve(
            to: CGPoint(x: rect.width, y: 80),
            control: CGPoint(x: rect.width / 2, y: -80)
        )

        // Right side vertical down
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))

        // Close path
        path.closeSubpath()

        return path
    }
}

#Preview {
    Home()
}
