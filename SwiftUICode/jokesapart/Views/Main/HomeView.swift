//
//  HomeView.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var service = JokeService()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.theme.white.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    // Top Image
                    Image("HomeScreenImage")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                        .ignoresSafeArea()
                    
                    Spacer()
                }
                
                VStack(spacing: 0) {
                    
                    // Curved background card
                    CurvedTopShape()
                        .fill(Color.theme.white)
                        .frame(height: 380)
                    Spacer()
                }
                .padding(.top, 180)
                .offset(y:-30)
                
                VStack(spacing: 20) {
                    
                    NavigationLink(
                        destination: ProfileView()
                    ){
                        VStack(alignment: .center) {
                            
                            
                            ZStack {
                                Circle()
                                    .fill(Color.theme.white)
                                    .frame(width: 120, height: 120)
                                    .shadow(radius: 4)
                                
                                Circle()
                                    .stroke(Color.theme.green, lineWidth: 4)
                                    .frame(width: 120, height: 120)
                                
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 75)
                                    .foregroundStyle(Color.theme.darkGreen)
                            }
                            .frame(width: 120, height: 120) // important for tappable area
                        }
                        .buttonStyle(.plain)
                        .padding(.top, 180)
                    }
                    Text("Username")
                        .foregroundStyle(Color.theme.darkGreen)
                        .font(Font.custom("IrishGrover-Regular", size: 44))
                    
                    Text("Today's Joke")
                        .foregroundStyle(Color.theme.darkGreen.opacity(0.9))
                        .font(Font.custom("InstrumentSerif-Regular", size: 30))
                    
                    Text("\"\(service.currentJoke)\"")
                        .font(Font.custom("InstrumentSerif-Regular", size: 24))
                        .frame(maxWidth: 300)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.theme.darkGreen.opacity(0.85))
                    
                    Button(action: {
                        print("Refresh button pressed")
                        service.fetchJoke()
                    }) {
                        Text("Refresh")
                            .font(Font.custom("IrishGrover-Regular", size: 26))
                            .frame(width: 180, height: 48)
                            .foregroundStyle(Color.theme.white)
                            .background(Color.theme.green)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    }.onAppear(
                        perform: service.fetchJoke
                    )
                    .shadow(color: Color.theme.darkGreen.opacity(0.5), radius: 8, y: 3)
                    
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Curve Shape
struct CurvedTopShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: 100))
        path.addQuadCurve(
            to: CGPoint(x: rect.width, y: 100),
            control: CGPoint(x: rect.width / 2, y: -90)
        )
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    HomeView()
}
