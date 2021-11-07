//
//  MoodView.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI

public struct JournalView<Goals: View, Moods: View>: View {
    
    var moodViewProvider: () -> Moods
    var goalsViewProvider: () -> Goals
    
    public init(
        moodViewProvider: @escaping  () -> Moods,
        goalsViewProvider: @escaping  () -> Goals
    ) {
        self.moodViewProvider = moodViewProvider
        self.goalsViewProvider = goalsViewProvider
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                List {
                    moodSection
                    goalsSection
                    gratitudeSection
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Today")
        }
    }
    
    var moodSection: some View {
        Section(
            content: {
                Text("You haven't selected a mood yet")
            },
            header: {
                JournalHeaderView(
                    headerTitle: "Mood",
                    headerImage: "chevron.right",
                    destination: self.moodViewProvider
                )
            }
        )
    }
    
    var goalsSection: some View {
        Section(
            content: {
                Text("You haven't add a goal yet")
            },
            header: {
                JournalHeaderView(
                    headerTitle: "Goals",
                    headerImage: "plus",
                    destination: self.goalsViewProvider
                )
            }
        )
    }
    
    var gratitudeSection: some View {
        Section(
            content: {
                Text("You haven't added a gratitude yet")
            },
            header: {
                JournalHeaderView(
                    headerTitle: "Gratitude",
                    headerImage: "plus",
                    destination: { Text("Gratitude") }
                )
            }
        )
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(
            moodViewProvider: { return Text("Choose your mood") },
            goalsViewProvider: { return Text("Provide your goals") }
        )
    }
}
