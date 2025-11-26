
//
//  Library.swift
//  jokesapart
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct Library: View {
    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // ZStack to overlay the triangle shape and text on top of the image
                ZStack {
                    // Image with reduced height to make room for two scroll items below
                    Image("LibraryScreenImage")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300) // Reduced from 300 to create more space for content
                        .ignoresSafeArea()
                    
                    // White triangle shape on top of the image
                    TriangleShape()
                        .fill(Color.white)
                        .frame(height: 200) // Adjusted height for the triangle
                    
                    // Text positioned on the shape
                    Text("Library")
                        .font(Font.custom("IrishGrover-Regular", size: 60))
                        .foregroundColor(.theme.darkGreen)
                        .padding(.top,200)
                }
                
                // ScrollView starts here, below the image and overlay
                ScrollView {
                    // Content Area
                    VStack(spacing: 10) {
                        ForEach(0..<3) { i in
                            ZStack {
                                // Card background
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.theme.green)
                                    .frame(width: 350, height: 200)
                                
                                // Text content
                                Text("JOKE \(i + 1)")
                                    .foregroundStyle(Color.theme.white)
                                    .padding() // Internal padding for the text
                            }
                            .overlay(alignment: .topTrailing) {
                                VStack(spacing: 10) { // Stack the star and share icon vertically
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(Color.theme.star)
                                    Image(systemName: "square.and.arrow.up")
                                        .foregroundStyle(Color.theme.white)
                                }
                                .font(Font.system(size: 30))
                                .padding(10) // Padding from the top-right edge of the card
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, 40)
                }.scrollIndicators(.hidden)
                
                // Bottom navbar remains fixed at the bottom
                BottomNavBar(activeIndex: 0) { index in
                    print("Tapped nav index: \(index)")
                }
                .padding(.top,10)
                .padding(.bottom, 10)
            }
        }
    }

    // Updated shape to a simple triangle
    struct TriangleShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY)) // Top-left
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom-right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY)) // Top-right
            path.closeSubpath() // Back to top-left
            return path
        }
    }
}

#Preview {
    Library()
}
