//
//  CardView.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import SwiftUI

struct CardView: View {
    var story: Story // Assuming Story is a model representing each story or quest

    var body: some View {
        VStack {
            Image(story.imageName) // Replace with actual image
                .resizable()
                .aspectRatio(contentMode: .fill)
            Text(story.title)
                .font(.headline)
            Text(story.description)
                .font(.body)
        }
        .frame(width: 300, height: 400)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct Story {
    let title: String
    let description: String
    let imageName: String
}
