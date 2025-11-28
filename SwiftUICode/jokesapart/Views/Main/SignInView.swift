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
        NavigationStack {
            ZStack {
                Color.theme.white.ignoresSafeArea()
                
                VStack {
                    // Title
                    VStack {
                        Text("Jokes")
                        Text("APart")
                    }
                    .foregroundStyle(Color.theme.darkGreen)
                    .font(Font.custom("IrishGrover-Regular", size: 75))
                    
                    Text("Sign In")
                        .foregroundStyle(Color.theme.darkGreen)
                        .font(Font.custom("IrishGrover-Regular", size: 30))
                    
                    Spacer()
                    
                    // Input Fields
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
                    
                    // Sign In Button
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
                    .shadow(color: Color.theme.darkGreen.opacity(0.6), radius: 10, y: 4)
                    
                    // Error Message
                    if let message = viewModel.errorMessage {
                        Text(message)
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.top, 5)
                    }
                    
                    Spacer()
                    
                    // Footer: Navigate to SignUpView
                    HStack {
                        Text("New User?")
                        NavigationLink(destination: SignUpView()) {
                            Text("Create Account")
                                .foregroundStyle(Color.theme.green)
                        }
                    }
                    .font(Font.custom("InriaSans-Regular", size: 20))
                    .padding(.bottom, 20)
                }
            }
            .alert(
                "Account Created Successfully 🎉",
                isPresented: $appState.didJustCreatedAccount
            ) {
                Button("OK") {
                    appState.didJustCreatedAccount = false
                }
            }
        }
    }
}

#Preview {
    SignInView()
        .environmentObject(AppState())
}
