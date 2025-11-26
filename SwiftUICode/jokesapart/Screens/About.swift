//
//  About.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct About: View {
    var body: some View {
        ZStack {
            Color.theme.white.ignoresSafeArea()
            
            VStack {
                Text("About")
                    .foregroundStyle(Color.theme.darkGreen)
                    .font(Font.custom("IrishGrover-Regular", size: 80))
                
                VStack {
                    Text("JokesAPart")
                    Spacer().frame(height: 10)
                    Text("This is a fun app to know some jokes to crack while you talk to your friends!")
                }
                .foregroundStyle(Color.theme.darkGreen)
                .frame(width: 350)
                .font(Font.custom("InstrumentSerif-Regular", size: 35))
                .multilineTextAlignment(.center)
                
                Image("Onboardingimage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 550, height: 450)
                    .offset(y: -50)
                
                Text("Created with 💚 by Omkar Bagade.")
                    .font(Font.custom("InriaSans-Regular", size: 20))
                
                Spacer()
                
                // Bottom navbar
                BottomNavBar(activeIndex: 2) { index in
                    print("Tapped nav index: \(index)")
                }
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    About()
}
