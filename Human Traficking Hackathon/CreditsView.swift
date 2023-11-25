//
//  CreditsView.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Text("Our Team")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)

            ScrollView {
                ForEach(0..<4) { index in
                    TeamMemberCard(index: index)
                        .padding(.top, index == 0 ? 20 : 0)
                }
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TeamMemberCard: View {
    let index: Int
    // Placeholder data for team members
    let names = ["Member 1", "Member 2", "Member 3", "Member 4"]
    let roles = ["Role 1", "Role 2", "Role 3", "Role 4"]

    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle") // Placeholder for team member image
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top, 20)
                .scaleEffect(1 + CGFloat(index) * 0.1) // Simple scale animation
                .animation(.easeInOut(duration: 1.0), value: index)

            Text(names[index])
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 10)

            Text(roles[index])
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal, 40)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
