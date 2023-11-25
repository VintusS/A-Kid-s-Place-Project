//
//  ContentView.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var stories = [Story(title: "Story 1", description: "Description 1", imageName: "image1"),
                                  Story(title: "Story 2", description: "Description 2", imageName: "image2")]
    @State private var translation: CGSize = .zero

    var body: some View {
        ZStack {
            ForEach(stories, id: \.title) { story in
                CardView(story: story)
                    .offset(x: self.translation.width, y: 0)
                    .rotationEffect(.degrees(Double(self.translation.width / 10)))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.translation = value.translation
                            }
                            .onEnded { value in
                                self.translation = .zero
                                // Add logic to handle the swipe direction
                            }
                    )
            }
        }
    }
}


#Preview {
    ContentView()
}
