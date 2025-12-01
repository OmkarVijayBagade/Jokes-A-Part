//
// Profile.swift
// jokesapart
//
// Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var selectedImage: UIImage?
    @State private var showPicker = false
    
    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()

            VStack {
                Text("Profile")
                    .font(Font.custom("IrishGrover-Regular", size: 80))

                ZStack {
                    Circle()
                        .stroke(
                            style: StrokeStyle(lineWidth: 5, dash: [20, 30])
                        )
                        .frame(width: 185, height: 185)
                    if let image = selectedImage{
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 175,height:175)
                            .clipShape(Circle())
                            .onTapGesture {
                                showPicker.toggle()
                            }
                    }else {
                        Circle()
                            .fill(Color.theme.green)
                            .frame(width: 175, height: 175)
                            .overlay(
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(25)
                                    .foregroundColor(.white)
                            )
                            .onTapGesture {
                                showPicker.toggle()
                            }
                    }
                }
                .photosPicker(
                    isPresented: $showPicker,
                    selection: Binding(
                        get: { nil },
                        set: { item in
                            Task {
                                if let data = try? await item?.loadTransferable(type: Data.self) {
                                    selectedImage = UIImage(data: data)
                                }
                            }
                        }
                    ),
                    matching: .images
                )

                Spacer().frame(height: 40)

                Rectangle()
                    .fill(Color.theme.darkGreen)
                    .frame(width: 300, height: 1)

                VStack(alignment: .leading) {
                    // username
                    VStack(alignment: .leading) {
                        Text("Username:")
                            .font(Font.custom("IrishGrover-Regular", size: 40))

                        Text("Omkar Bagade")
                            .font(Font.custom("InriaSans-Regular", size: 25))
                    }

                    Spacer().frame(height: 10)

                    // email
                    VStack(alignment: .leading) {
                        Text("Email:")
                            .font(Font.custom("IrishGrover-Regular", size: 40))

                        Text("omkarbagade16@gmail.com")
                            .font(Font.custom("InriaSans-Regular", size: 25))
                    }
                }

                Spacer()

                // logout Button
                Button(action: {
                    authViewModel.logOut(appState: appState)
                }) {
                    HStack {
                        Text("Log Out")
                            .foregroundStyle(Color.theme.white)
                            .frame(width: 148, height: 35)
                            .font(Font.custom("IrishGrover-Regular", size: 30))
                    }
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                .shadow(color: Color.red, radius: 10, y: 4)
                .foregroundStyle(Color.theme.darkGreen)
                .offset(y:-40)
                Spacer()
            }
        }
    }
}

