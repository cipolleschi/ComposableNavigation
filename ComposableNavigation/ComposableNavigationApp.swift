//
//  ComposableNavigationApp.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI
import Tabbar
import Journal
import Moods
import GoalsView

@main
struct ComposableNavigationApp: App {
    var body: some Scene {
        WindowGroup {
            Tabbar(tabProviders: [
                journalTabProvider,
                profileTabProvider
            ])
        }
    }
    
    var journalTabProvider: TabViewProvider {
        return .init(
            systemImageName: "heart.circle.fill",
            tabName: "Journal"
        ) {
            return JournalView(
                moodViewProvider: { return MoodView() },
                goalsViewProvider: { return GoalsView() }
            ).erased
        }
    }
    
    var profileTabProvider: TabViewProvider {
        return .init(
            systemImageName: "person.circle.fill",
            tabName: "Profile"
        ) {
            return Text("Second Tab").erased
        }
    }
}

extension View {
    var erased: AnyView {
        return AnyView(self)
    }
}
