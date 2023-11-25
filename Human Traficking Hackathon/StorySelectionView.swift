//
//  StorySelectionView.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import SwiftUI

struct StorySelectionView: View {
    var body: some View {
        VStack {
            Text("Choose a Story")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 50)

            ScrollView {
                ForEach(1...8, id: \.self) { index in
                    StoryButton(storyNumber: index)
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
    }
}

struct StoryButton: View {
    var storyNumber: Int

    var body: some View {
        Button(action: {
            // Action for selecting a story
        }) {
            Text("Story \(storyNumber)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 40)
                .padding(.top, 20)
        }
    }
}

struct StorySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        StorySelectionView()
    }
}
