//
//  MainMenuView.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()
                Text("📚🕹️ \n A kid's play")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)

                Spacer()

                NavigationLink(destination: StorySelectionView()) {
                    Text("Start")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 40)

                NavigationLink(destination: CreditsView()) {
                    Text("Credits")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 40)

                Spacer()
            }
            .background((LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
