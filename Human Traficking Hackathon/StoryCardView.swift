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
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var toastColor = Color.green


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
                    .multilineTextAlignment(.center)
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

            if showToast {
                    ToastView(message: toastMessage, color: toastColor)
                        .transition(.opacity)
                        .zIndex(1)
                }
            
            if showEndCard {
                EndCardView(rightAnswerCount: rightAnswerCount, total: storyCards.count) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
    }

    private func answerChosen(answer: String) {
        let correctAnswer = storyCards[currentCardIndex].answer1
        if answer == correctAnswer {
            rightAnswerCount += 1
            toastMessage = "Good Job"
            toastColor = Color.green
        } else {
            toastMessage = "Wrong"
            toastColor = Color.red
        }
        
        showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Hide toast after 2 seconds
            showToast = false
            if currentCardIndex < storyCards.count - 1 {
                currentCardIndex += 1
                flipped = false
            } else {
                showEndCard = true
            }
        }
    }
}


struct ToastView: View {
    var message: String
    var color: Color

    var body: some View {
        HStack {
            Image(systemName: color == Color.green ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(color)
            Text(message)
                .foregroundColor(color)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


struct EndCardView: View {
    var rightAnswerCount: Int
    var total: Int
    var onDismiss: () -> Void
    @State private var animate = false

    var body: some View {
        VStack {
            Text(rightAnswerCount >= 5 ? "Very Nice!" : "Good Try")
                .font(.largeTitle)
                .fontWeight(.bold)

            if rightAnswerCount >= 5 {
                ZStack {
                    ForEach(0..<5, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.yellow)
                            .opacity(animate ? 1 : 0)
                            .scaleEffect(animate ? 1.5 : 1)
                            .rotationEffect(.degrees(animate ? 360 : 0))
                            .offset(x: CGFloat(index - 2) * 30, y: animate ? -50 : 0)
                    }
                }
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                        animate = true
                    }
                }
            }

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
                    .cornerRadius(10)
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .padding()
                Text(card.text)
                    .font(.title3)
                    .padding()
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)

            } else {
                Text(card.explanation)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding()
                    .multilineTextAlignment(.center)

                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.3))
        .shadow(radius: 5)
        .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation {
                flipped.toggle()
            }
        }
        .cornerRadius(10)
    }
}


struct AnswerButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 17))
            .bold()
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
            .multilineTextAlignment(.center)

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
