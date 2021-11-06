//
//  MoodView.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI

struct JournalView: View {
    var body: some View {
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
                    destination: { MoodView() }
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
                    destination: { GoalsView() }
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
        JournalView()
    }
}
