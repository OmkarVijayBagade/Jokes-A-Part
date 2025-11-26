//
//  Onboarding.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import SwiftUI

struct Onboarding: View {
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
                .font(Font.custom("IrishGrover-Regular", size: 80))
                .offset(x: -20)

                //Hero image
                Image("Onboardingimage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 550, height: 550)
                    .padding(.top, -196)

                VStack(spacing: 5) {
                    Text("Welcome to The Jokes APart")
                        .foregroundStyle(Color.theme.darkGreen)
                        .font(Font.custom("IrishGrover-Regular", size: 30))
                        .multilineTextAlignment(.center)

                    Text("Let’s  have fun with jokes .")
                        .foregroundStyle(Color.theme.darkGreen)
                        .font(Font.custom("InriaSans-Regular", size: 20))
                }
                .padding(.horizontal, 20)
                .padding(.top, -100)

                Spacer()

                //Button
                Button(action: {}) {
                    HStack {
                        Text("Lets Go")
                            .foregroundStyle(Color.theme.white)
                            .frame(width: 148, height: 35)
                            .font(Font.custom("IrishGrover-Regular", size: 30))
                            
                        Image(systemName: "arrow.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width:30,height:30)
                            .foregroundStyle(Color.theme.white)
                    }
                    .frame(width: 200, height: 50)
                    .background(Color.theme.green)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                .padding(.top,-50)
                .shadow(color: Color.darkGreen ,radius: 10,y:4)
                
                Spacer()
                
                VStack(spacing: 5) {
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
    Onboarding()
}
