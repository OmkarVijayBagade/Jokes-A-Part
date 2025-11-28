//
//  SignUpView.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 28/11/25.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel = AuthViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var showSuccess = false
    
    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Jokes")
                    Text("APart")
                }
                .foregroundStyle(Color.theme.darkGreen)
                .font(Font.custom("IrishGrover-Regular", size: 75))
                
                Text("Create Account")
                    .foregroundStyle(Color.theme.darkGreen)
                    .font(Font.custom("IrishGrover-Regular", size: 30))
                
                Spacer()
                
                VStack(spacing: 25) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Email")
                        TextField("Enter Email", text: $viewModel.email)
                            .padding()
                            .frame(height: 60)
                            .background(Color.black.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Password")
                        SecureField("Enter Password", text: $viewModel.password)
                            .padding()
                            .frame(height: 60)
                            .background(Color.black.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
                .font(Font.custom("IrishGrover-Regular", size: 26))
                .padding(.horizontal)
                .offset(y: -20)
                
                Spacer()
                
                // Sign Up Button
                Button(action: {
                    viewModel.signUp(appState: appState) { success in
                        if success {
                            showSuccess = true
                        }
                    }
                }) {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                        .font(Font.custom("IrishGrover-Regular", size: 28))
                        .frame(width: 200, height: 50)
                        .background(Color.theme.green)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                .padding(.top, -20)
                .shadow(color: Color.theme.darkGreen.opacity(0.6), radius: 10, y: 4)
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top, 5)
                }
                
                Spacer()
            }
        }
        .alert("Account Created 🎉", isPresented: $showSuccess) {
            Button("OK") {
                dismiss() // returns user to SignInView
            }
        }
    }
}

#Preview {
    SignUpView()
        .environmentObject(AppState())
}
