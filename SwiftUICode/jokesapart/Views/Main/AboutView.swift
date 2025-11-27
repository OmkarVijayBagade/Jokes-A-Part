//
// About.swift
// jokesapart
//
// Created by Omkar Vijay Bagade on 26/11/25.

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()

            VStack(spacing: 24) {

                Text("About")
                    .foregroundStyle(Color.theme.darkGreen)
                    .font(Font.custom("IrishGrover-Regular", size: 60))

                Text("JokesAPart")
                    .foregroundStyle(Color.theme.darkGreen)
                    .font(Font.custom("InstrumentSerif-Regular", size: 36))

                Text("This is a fun app to know some jokes to crack while you talk to your friends!")
                    .foregroundStyle(Color.theme.darkGreen.opacity(0.85))
                    .font(Font.custom("InstrumentSerif-Regular", size: 24))
                    .frame(maxWidth: 320)
                    .multilineTextAlignment(.center)

                Image("Onboardingimage")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 360)
                    .padding(.vertical, 10)

                Text("Created with 💚 by Omkar Bagade")
                    .font(Font.custom("InriaSans-Regular", size: 18))
                    .foregroundStyle(Color.theme.darkGreen.opacity(0.8))
                    .padding(.top, -40)

                Spacer()
            }
//            .padding(.top, 80)
        }
    }
}

#Preview {
    AboutView()
}
