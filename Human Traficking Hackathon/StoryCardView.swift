//
//  GameView.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import SwiftUI

struct StoryCardView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var storyCards: [Card]
    @State private var currentCardIndex = 0
    @State private var flipped = false
    @State private var dragState = CGSize.zero
    @State private var rightAnswerCount = 0
    @State private var showEndCard = false

    let storyTitle: String

    init(storyTitle: String, storyCards: [Card]) {
        self.storyTitle = storyTitle
        self._storyCards = State(initialValue: storyCards)
    }

    var body: some View {
        ZStack {
            VStack {
                Text(storyTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 50)

                Spacer()

                if currentCardIndex < storyCards.count {
                    let card = storyCards[currentCardIndex]
                    let answers = [card.answer1, card.answer2].shuffled()

                    CardView(card: card, flipped: $flipped)
                        .padding()
                        .offset(x: dragState.width)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    dragState = gesture.translation
                                }
                                .onEnded { _ in
                                    if abs(dragState.width) > 100 {
                                        answerChosen(answer: dragState.width > 0 ? answers[1] : answers[0])
                                    }
                                    dragState = .zero
                                }
                        )
                        .animation(.interpolatingSpring(stiffness: 100, damping: 10), value: dragState)

                    HStack {
                        ForEach(answers, id: \.self) { answer in
                            Button(answer) {
                                answerChosen(answer: answer)
                            }
                            .buttonStyle(AnswerButtonStyle())
                        }
                    }
                    .padding([.leading, .bottom, .trailing], 20)
                }

                Spacer()
            }
            .blur(radius: showEndCard ? 20 : 0)

            if showEndCard {
                EndCardView(rightAnswerCount: rightAnswerCount, total: storyCards.count) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
    }

    private func answerChosen(answer: String) {
        let correctAnswer = storyCards[currentCardIndex].answer1
        if answer == correctAnswer {
            rightAnswerCount += 1
        }

        if currentCardIndex < storyCards.count - 1 {
            currentCardIndex += 1
            flipped = false
        } else {
            showEndCard = true
        }
    }
}

struct EndCardView: View {
    var rightAnswerCount: Int
    var total: Int
    var onDismiss: () -> Void

    var body: some View {
        VStack {
            Text("Quiz Complete!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("You got \(rightAnswerCount) out of \(total) right!")
                .font(.headline)
            
            Button("Close") {
                onDismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}


struct CardView: View {
    let card: Card
    @Binding var flipped: Bool

    var body: some View {
        VStack {
            if !flipped {
                Image(card.imagePath)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                Text(card.text)
                    .font(.title3)
                    .padding()
                    .foregroundStyle(.white)
            } else {
                Text(card.explanation)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding()
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0)) // Counter-rotate the text
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.3))
        .cornerRadius(10)
        .shadow(radius: 5)
        .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation {
                flipped.toggle()
            }
        }
    }
}


struct AnswerButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .bold()
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
    }
}

struct StoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCards = [
            Card(
                imagePath: "exampleImage1",
                text: "Sample text for Card 1",
                explanation: "Explanation for Card 1",
                answer1: "Correct Answer",
                answer2: "Wrong Answer"
            ),
            Card(
                imagePath: "exampleImage2",
                text: "Sample text for Card 2",
                explanation: "Explanation for Card 2",
                answer1: "Correct Answer",
                answer2: "Wrong Answer"
            )
        ]
        StoryCardView(storyTitle: "Sample Story Title", storyCards: sampleCards)
            .previewLayout(.sizeThatFits)
    }
}
