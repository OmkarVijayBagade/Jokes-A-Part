//
// LibraryView.swift
// jokesapart
// Created by Omkar Vijay Bagade on 29/11/25.
//

import SwiftUI

struct LibraryView: View {
    @State private var showShareSheet = false
    @State private var selectedJokeText = ""
    @StateObject private var viewModel = LibraryViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.white.ignoresSafeArea()

                VStack(spacing: 0) {
                    ZStack(alignment: .bottom) {
                        Image("LibraryScreenImage")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .clipped()
                            .ignoresSafeArea()

                        Text("Library")
                            .font(Font.custom("IrishGrover-Regular", size: 54))
                            .foregroundColor(.theme.darkGreen)
                            .padding(.bottom, 10)
                    }

                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 20) {
                            ForEach(viewModel.jokes) { joke in
                                JokeCardView(
                                    joke: joke,
                                    onShare: {
                                        selectedJokeText = joke.joke
                                        showShareSheet = true
                                    },
                                    onFavorite: {
                                        // TODO: implement favorites storage
                                        print("⭐ Favorited: \(joke.joke)")
                                    }
                                )
                                .onAppear {
                                    // trigger load more when we near the end
                                    if joke.id == viewModel.jokes.last?.id {
                                        viewModel.fetchMoreJokes()
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    }
                }
            }
            .onAppear {
                if viewModel.jokes.isEmpty {
                    viewModel.fetchMoreJokes()
                }
            }
            .sheet(isPresented: $showShareSheet) {
                CustomShareSheet(onClose: {
                    showShareSheet = false
                })
                .presentationDetents([.height(200)])
                .presentationDragIndicator(.visible)
            }
        }
    }
}

struct CustomShareSheet: View {
    var onClose: () -> Void

    var body: some View {
        VStack(spacing: 25) {

            Text("Share")
                .font(.system(size: 22, weight: .semibold))

            HStack(spacing: 40) {

                Image("linkIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)

                Image("whatsappIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)

                Image("instagramIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)

                Image("xIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)
            }

        }
    }
}

struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    LibraryView()
}
