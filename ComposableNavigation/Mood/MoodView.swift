//
//  MoodView.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI

struct MoodView: View {
    var body: some View {
        VStack {
            Text("How do you feel today?")
                .font(.title2)
            Text("Keeping track of your mood can help you reflect on yourself and understand what makes you happy, sad, upset and so on.")
                .font(.subheadline)
                .padding()
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
                    ForEach(Self.moodList, id: \.self) {
                        MoodCell(content: $0)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Mood")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}

extension MoodView {
    static let moodList: [String] = [
        "Surprised",
        "Stressed",
        "Mad",
        "Loved",
        "Lonely",
        "Weird",
        "Uncomfortable",
        "Touched",
        "Tired",
        "Thankful",
        "Sympathetic",
        "Smart",
        "Sleepy",
        "Silly",
        "Pleased",
        "Pessimistic",
        "Sick",
        "Shocked",
        "Satisfied",
        "Sad",
        "Rushed",
        "Restless",
        "Relieved",
        "Relaxed",
        "Rejuvenated",
        "Rejected",
        "Refreshed",
        "Recumbent",
        "Quixotic",
        "Predatory",
        "Peaceful",
        "Optimistic",
        "Okay",
        "Numb",
        "Giggly",
        "Giddy",
        "Nerdy",
        "Infuriated",
        "Indifferent",
        "Indescribable",
        "Naughty",
        "Morose",
        "Moody",
        "Mischievous",
        "Mellow",
        "Melancholy",
        "Listless",
        "Lethargic",
        "Lazy",
        "Jubilant",
        "Jealous",
        "Irritated",
        "Irate",
        "Impressed",
        "Hyper",
        "Hungry",
        "Hot",
        "Hopeful",
        "High",
        "Happy",
        "Guilty",
        "Grumpy",
        "Groggy",
        "Grateful",
        "Dorky",
        "Ditzy",
        "Discontent",
        "Good",
        "Gloomy",
        "Geeky",
        "Full",
        "Frustrated",
        "Flirty",
        "Exhausted",
        "Excited",
        "Enraged",
        "Energetic",
        "Anxious",
        "Annoyed",
        "Angry",
        "Ecstatic",
        "Drunk",
        "Drained",
        "Disappointed",
        "Dirty",
        "Devious",
        "Determined",
        "Depressed",
        "Dark",
        "Cynical",
        "Curious",
        "Alone",
        "Aggravated",
        "Accomplished",
        "Accepted",
        "Crushed",
        "Crazy",
        "Crappy",
        "Cranky",
        "Content",
        "Confused",
        "Complacent",
        "Cold",
        "Chipper",
        "Cheerful",
        "Calm",
        "Bouncy",
        "Bored",
        "Blissful",
        "Blank",
        "Blah",
        "Bittersweet",
        "Bewildered",
        "Awake",
        "Ashamed",
        "Apathetic",
        "Amused",
        "Exanimate",
        "Envious",
        "Enthralled"
    ]
}
