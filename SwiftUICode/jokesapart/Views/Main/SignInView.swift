//
//  SignIn.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel = AuthViewModel()

    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()

            VStack {
                // Hero Text
                VStack {
                    Text("Jokes")
                    Text("APart")
                }
                .foregroundStyle(Color.theme.darkGreen)
                .font(Font.custom("IrishGrover-Regular", size: 75))

                Text("Sign In")
                    .foregroundStyle(Color.theme.darkGreen)
                    .font(Font.custom("IrishGrover-Regular", size: 30))
                    .multilineTextAlignment(.center)

                Spacer()

                // MARK: - Input Fields
                VStack(spacing: 25) {

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Email")
                            .font(Font.custom("IrishGrover-Regular", size: 26))
                            .foregroundStyle(Color.theme.darkGreen)

                        TextField("Enter Email", text: $viewModel.email)
                            .padding()
                            .frame(height: 60)
                            .background(Color.black.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Password")
                            .font(Font.custom("IrishGrover-Regular", size: 26))
                            .foregroundStyle(Color.theme.darkGreen)

                        SecureField("Enter Password", text: $viewModel.password)
                            .padding()
                            .frame(height: 60)
                            .background(Color.black.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
                .padding(.horizontal)
                .offset(y: -30)

                Spacer()

                // MARK: - Icon Picker (Filler for now)
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .foregroundStyle(Color.theme.darkGreen)
                        }
                    }
                }
                .padding(.horizontal)
                .offset(y: -40)
                .scrollIndicators(.hidden)

                // MARK: - Sign In Button
                Button(action: {
                    viewModel.signIn(appState: appState)
                }) {
                    Text("Sign In")
                        .foregroundStyle(.white)
                        .font(Font.custom("IrishGrover-Regular", size: 28))
                        .frame(width: 200, height: 50)
                        .background(Color.theme.green)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                .padding(.top, -20)
                .shadow(color: Color.darkGreen.opacity(0.6), radius: 10, y: 4)

                // MARK: - Footer
                VStack(spacing: 4) {
                    HStack {
                        Text("Having Issues?")
                        Text("Get Help")
                            .foregroundStyle(Color.theme.green)
                    }

                    HStack {
                        Text("New User?")
                        Text("Create Account")
                            .foregroundStyle(Color.theme.green)
                    }
                }
                .font(Font.custom("InriaSans-Regular", size: 20))
                .offset(y: 5)
            }
        }
    }
}

#Preview {
    SignInView()
        .environmentObject(AppState())
}
