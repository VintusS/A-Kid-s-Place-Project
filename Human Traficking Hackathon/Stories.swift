//
//  Stories.swift
//  Human Traficking Hackathon
//
//  Created by Mindrescu Dragomir on 25.11.2023.
//

import Foundation

// MARK: Important
// We had some issues reading json file and we didn't manage to fix it. So we created the variables in this file

struct Story {
    let title: String
    let cards: [Card]
    var isLocked: Bool
}

struct Card {
    let imagePath: String
    let text: String
    let explanation: String
    let answer1: String
    let answer2: String
}

let stories = [
    Story(
        title: "The Mysterious New Friend⭐️",
        cards: [
            Card(
                imagePath: "card_1_1",
                text: "Jake meets a new kid, Alex, who seems very friendly.",
                explanation: "Initial encounters with new people can be exciting but caution is necessary.",
                answer1: "Be cautious",
                answer2: "Share everything"
            ),
            Card(
                imagePath: "card_1_2",
                text: "Alex offers Jake gifts and invites him to a special club.",
                explanation: "Offers from new acquaintances, especially gifts, can be a red flag.",
                answer1: "Decline and consult parents",
                answer2: "Accept and go alone"
            ),
            Card(
                imagePath: "card_1_3",
                text: "Jake accepts a gift from Alex.",
                explanation: "Accepting gifts can create a sense of obligation.",
                answer1: "Talk to parents",
                answer2: "Keep accepting gifts"

            ),
            Card(
                imagePath: "card_1_4",
                text: "Jake tells his parents about Alex and his offer.",
                explanation: "Sharing concerns with trusted adults is crucial for safety.",
                answer1: "Seek parents' advice",
                answer2: "Ignore parents"
            ),
            Card(
                imagePath: "card_1_5",
                text: "Jake decides to go to the club without telling anyone.",
                explanation: "Going to unfamiliar places without informing trusted individuals is risky.",
                answer1: "Stay home",
                answer2: "Go alone"

            ),
            Card(
                imagePath: "card_1_6",
                text: "The importance of not accepting gifts from strangers and always informing trusted adults about new friends and invitations.",
                explanation: "Awareness and communication with trusted adults are key to safety.",
                                    answer1: "Learn and educate others",
                                    answer2: "Ignore the risks"            ),
        ], isLocked: false
    ),
    Story(
        title: "The Online Adventure💻",
        cards: [
            Card(
                imagePath: "card_2_1",
                text: "Annie loves playing online games.",
                explanation: "Online games are fun but can have risks.",
                answer1: "Be cautious online",
                answer2: "Trust all players"
            ),
            Card(
                imagePath: "card_2_2",
                text: "One day, she meets a player who asks her personal questions.",
                explanation: "Strangers asking personal questions online is a warning sign.",
                answer1: "Don't share info",
                answer2: "Share personal details"
            ),
            Card(
                imagePath: "card_2_3",
                text: "Annie shares her school name and address with the online player.",
                explanation: "Sharing personal information online can be dangerous.",
                                    answer1: "Inform a trusted adult",
                                    answer2: "Continue sharing"
            ),
            Card(
                imagePath: "card_2_4",
                text: "Annie tells her older sister about the player.",
                explanation: "Telling trusted people about online interactions is important.",
                answer1: "Discuss with sister",
                answer2: "Ignore sister's advice"
            ),
            Card(
                imagePath: "card_2_5",
                text: "Annie agrees to meet the player in person.",
                explanation: "Meeting online acquaintances in person can be unsafe.",
                                    answer1: "Refuse to meet",
                                    answer2: "Meet alone"
            ),
            Card(
                imagePath: "card_2_6",
                text: "Annie agrees to meet the player in person.",
                explanation: "Meeting online acquaintances in person can be unsafe.",
                                    answer1: "Refuse to meet",
                                    answer2: "Meet alone"
            ),
            
        ], isLocked: true
    ),
    Story(
        title: "The Lost Dog Poster🐶",
            cards: [
                Card(
                    imagePath: "card_3_1",
                    text: "Leo sees a poster about a lost dog and a man nearby asks for his help to find it.",
                    explanation: "Being approached by strangers can be risky.",
                    answer1: "Seek help from adults",
                    answer2: "Help the stranger alone"
                ),
                Card(
                    imagePath: "card_3_2",
                    text: "Leo decides to help the man search for the dog.",
                    explanation: "Helping strangers without supervision can be dangerous.",
                    answer1: "Reconsider and refuse",
                    answer2: "Search with the stranger"
                ),
                Card(
                    imagePath: "card_3_3",
                    text: "Leo refuses and goes to tell a nearby police officer about the man. ",
                    explanation: "Reporting to authorities can ensure safety.",
                    answer1: "Talk to police",
                    answer2: "Ignore the situation"
                ),
                Card(
                    imagePath: "card_3_4",
                    text: "Leo asks the man for more details about the dog and tells him he will come back with his parents to help.",
                    explanation: "Involving trusted adults is a safe approach.",
                    answer1: "Bring parents",
                    answer2: "Go alone later"
                ),
                Card(
                    imagePath: "card_3_5",
                    text: "Caution when approached by strangers asking for help, and the importance of seeking assistance from trusted adults or authorities.",
                    explanation: "Learning to deal with strangers is important.",
                    answer1: "Learn and advise others",
                    answer2: "Disregard caution"
                )
            ], isLocked: true
        ),
    Story(
        title: "The Too-Good-to-be-True Job Offer🕵️",
            cards: [
                Card(
                    imagePath: "card_4_1",
                    text: "Mia hears about a fantastic job opportunity for young people in a faraway city from a friendly recruiter in her neighborhood.",
                    explanation: "Suspicious job offers can be a trap.",
                    answer1: "Verify the offer",
                    answer2: "Trust without verifying"
                ),
                Card(
                    imagePath: "card_4_2",
                    text: "Mia gives her personal details to the recruiter without checking the job's details.",
                    explanation: "Sharing personal details without verification is risky.",
                    answer1: "Stop and rethink",
                    answer2: "Continue sharing"
                ),
                Card(
                    imagePath: "card_4_3",
                    text: "Mia discusses the job offer with her family and school counselor.",
                    explanation: "Seeking advice from trusted adults is wise.",
                    answer1: "Follow their advice",
                    answer2: "Ignore their concerns"
                ),
                Card(
                    imagePath: "card_4_4",
                    text: "Mia plans to travel alone to the city to take the job.",
                    explanation: "Traveling alone on uncertain offers is dangerous.",
                    answer1: "Decide against going",
                    answer2: "Go alone"
                ),
                Card(
                    imagePath: "card_4_5",
                    text: "The importance of verifying information, especially job offers, and the value of seeking advice from trusted adults before making significant decisions.",
                    explanation: "Critical thinking about job offers is essential.",
                    answer1: "Learn and inform others",
                    answer2: "Disregard verification"
                )
            ], isLocked: true
        )
]

