//
//  GameView.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import SwiftUI

struct GameView: View {
    @State private var currentCardIndex = 0
    let story = Story.ofEmma

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Spacer()
                    MenuButton()
                }
                .padding()

                if currentCardIndex < story.cards.count {
                    StoryCardView(card: story.cards[currentCardIndex], onSwipe: handleSwipe)
                } else {
                    Text("End of Story")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
    }

    func handleSwipe(_ direction: SwipeDirection) {
        if direction == .left {
            // Logic for left swipe
            print("Choice Made: \(story.cards[currentCardIndex].leftChoice)")
        } else {
            // Logic for right swipe
            print("Choice Made: \(story.cards[currentCardIndex].rightChoice)")
        }

        if currentCardIndex < story.cards.count - 1 {
            currentCardIndex += 1
        }
    }
}

enum SwipeDirection {
    case left, right
}

struct StoryCardView: View {
    let card: StoryCard
    let onSwipe: (SwipeDirection) -> Void

    var body: some View {
        VStack {
            Text(card.description)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)

            HStack {
                ChoiceButton(choice: card.leftChoice, color: .red, onChoice: { onSwipe(.left) })
                ChoiceButton(choice: card.rightChoice, color: .green, onChoice: { onSwipe(.right) })
            }
        }
    }
}

struct ChoiceButton: View {
    let choice: String
    let color: Color
    let onChoice: () -> Void

    var body: some View {
        Button(action: onChoice) {
            Text(choice)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)
                .cornerRadius(10)
        }
    }
}

struct MenuButton: View {
    var body: some View {
        Button(action: {
            // Implement menu action
        }) {
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.white)
                .font(.title)
        }
    }
}

struct Story {
    let title: String
    let cards: [StoryCard]

    static var ofEmma: Story {
        Story(title: "Story of Emma: The Lost Teddy Bear", cards: [
            StoryCard(
                description: "Emma loses her favorite teddy bear in the park. A friendly-looking person offers to help her find it.",
                leftChoice: "Follow the person",
                rightChoice: "Get mother"
            ),
            // Add more cards as needed
        ])
    }
}

struct StoryCard {
    let description: String
    let leftChoice: String
    let rightChoice: String
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
