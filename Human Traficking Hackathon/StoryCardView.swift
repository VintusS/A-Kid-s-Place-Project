//
//  GameView.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import SwiftUI

struct StoryCardView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var storyCards = StoryCardData.allCases
    @State private var draggingState = CGSize.zero

    var body: some View {
        VStack {
            Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                        Text("Back")
                            .foregroundColor(.white)
                    }
                }
                .padding()
            Text("Your App Name") // Title of the app
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 20)

            ZStack {
                ForEach(storyCards, id: \.self) { card in
                    SwipeableCard(cardData: card, onSwipe: { direction in
                        handleSwipe(card, direction: direction)
                    })
                    .offset(x: self.draggingState.width)
                    .rotationEffect(.degrees(Double(self.draggingState.width / 20)), anchor: .bottom)
                    .gesture(
                        DragGesture()
                            .onChanged { value in self.draggingState = value.translation }
                            .onEnded { _ in self.draggingState = .zero }
                    )
                    .animation(.spring(), value: draggingState)
                    .zIndex(self.isTopCard(card) ? 1 : 0)
                    .padding(.horizontal, 20)
                }
            }

            HStack {
                Button("No") {
                    // Action for No
                }
                .buttonStyle(MainMenuButtonStyle())

                Button("Yes") {
                    // Action for Yes
                }
                .buttonStyle(MainMenuButtonStyle())
            }
            .padding(.top, 10)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .edgesIgnoringSafeArea(.all)    }


    private func handleSwipe(_ card: StoryCardData, direction: SwipeDirection) {
        storyCards.removeAll { $0 == card }
    }

    private func isTopCard(_ card: StoryCardData) -> Bool {
        guard let topCard = storyCards.last else { return false }
        return card == topCard
    }
}

struct MainMenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding([.leading, .bottom, .trailing], 20) // Padding to match the card's horizontal padding
    }
}



struct SwipeableCard: View {
    var cardData: StoryCardData
    var onSwipe: (SwipeDirection) -> Void

    var body: some View {
        VStack {
            Image(cardData.imageName)
                .resizable()
                .scaledToFit()

            Text(cardData.question)
                .font(.headline)

            HStack {
                Button("No") { onSwipe(.left) }
                Button("Yes") { onSwipe(.right) }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

enum StoryCardData: CaseIterable {
    case scenario1, scenario2 // Define your scenarios

    var question: String {
        // Return the question for each scenario
        switch self {
        case .scenario1:
            return "Question for Scenario 1"
        case .scenario2:
            return "Question for Scenario 2"
        }
    }

    var imageName: String {
        // Return the image name for each scenario
        return "placeholder_image"
    }
}

enum SwipeDirection {
    case left, right
}

struct StoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCardView()
    }
}
