//
//  SignIn.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct SignIn: View {
    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()
            VStack {
                //Hero Text
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

                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Username")
                            .font(Font.custom("IrishGrover-Regular", size: 30))
                            .padding(.horizontal, 10)
                            .foregroundStyle(Color.theme.darkGreen)
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.black.opacity(0.2))
                            .frame(height: 80)
                    }
                    .padding(.horizontal, 10)

                    VStack(alignment: .leading, spacing: 0) {
                        Text("Email")
                            .font(Font.custom("IrishGrover-Regular", size: 30))
                            .padding(.horizontal, 10)
                            .foregroundStyle(Color.theme.darkGreen)
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.black.opacity(0.2))
                            .frame(height: 80)
                    }
                    .padding(.horizontal, 10)

                    VStack(alignment: .leading, spacing: 0) {
                        Text("Password")
                            .font(Font.custom("IrishGrover-Regular", size: 30))
                            .padding(.horizontal, 10)
                            .foregroundStyle(Color.theme.darkGreen)
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.black.opacity(0.2))
                            .frame(height: 80)
                    }
                    .padding(.horizontal, 10)
                }.offset(y: -30)

                Spacer()

                //profile photos/icons
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .foregroundStyle(Color.theme.darkGreen)
                        }
                    }
                }
                .padding(.horizontal)
                .offset(y: -40)
                .scrollIndicators(.hidden)

                //Button
                Button(action: {}) {
                    HStack {
                        Text("Sign In")
                            .foregroundStyle(Color.theme.white)
                            .frame(width: 148, height: 35)
                            .font(Font.custom("IrishGrover-Regular", size: 30))

                    }
                    .frame(width: 200, height: 50)
                    .background(Color.theme.green)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                .padding(.top, -20)
                .shadow(color: Color.darkGreen, radius: 10, y: 4)
                .offset(y:-10)

                VStack(spacing: 0) {
                    HStack {
                        Text("Having Issues?")
                        Text("Get Help")
                            .foregroundStyle(Color.theme.green)
                    }
                    HStack {
                        Text("Already have an Account?")
                        Text("Sign In")
                            .foregroundStyle(Color.theme.green)
                    }

                }.font(Font.custom("InriaSans-Regular", size: 20))

            }
        }
    }
}

#Preview {
    SignIn()
}
