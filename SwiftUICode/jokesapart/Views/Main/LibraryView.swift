import SwiftUI

struct LibraryView: View {
    @State private var showShareSheet = false
    @State private var selectedJoke = ""

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

                        TriangleShape()
                            .fill(Color.white)
                            .frame(width: .infinity, height: 300)

                        Text("Library")
                            .font(Font.custom("IrishGrover-Regular", size: 54))
                            .foregroundColor(.theme.darkGreen)
                            .padding(.bottom, 10)
                    }

                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {
                            ForEach(0..<3) { i in
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.theme.green)
                                    .frame(width: 380, height: 180)
                                    .overlay(alignment: .topTrailing) {
                                        HStack(spacing: 20) {
                                            NavigationLink(
                                                destination: FavouritesView()
                                            ) {
                                                Image(systemName: "star.fill")
                                                    .font(.system(size: 28))
                                                    .foregroundStyle(
                                                        Color.theme.star
                                                    )
                                            }

                                            Button {
                                                withAnimation(.spring()) {
                                                    showShareSheet = true
                                                }
                                            } label: {
                                                Image(
                                                    systemName:
                                                        "square.and.arrow.up"
                                                )
                                                .font(.system(size: 26))
                                                .foregroundStyle(
                                                    Color.theme.white
                                                )
                                            }
                                        }
                                        .padding()
                                    }
                                    .overlay {
                                        Text("JOKE \(i + 1)")
                                            .foregroundStyle(Color.theme.white)
                                            .font(.title)
                                    }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    }
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
