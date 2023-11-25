//
//  CreditsView.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import SwiftUI

struct TeamMember {
    var name: String
    var role: String
    var imageName: String // Image name in the asset catalog
}

struct CreditsView: View {
    var body: some View {
        VStack {
            Text("Our Team")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 50)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 30) {
                ForEach(0..<4) { index in
                    TeamMemberCard(index: index)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
    }
}

struct TeamMemberCard: View {
    let index: Int
    let names = ["Balamatiuc Eduard", "Plamadeala Maxim", "Negai Marin", "Mindrescu Dragomir"]
    let images = ["eduardo", "maximiliano", "marinio", "dragomirio"]

    var body: some View {
        VStack {
            Image("\(images[index])")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.purple, lineWidth: 3))
                .shadow(radius: 5)

            Text(names[index])
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.top, 10)
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
