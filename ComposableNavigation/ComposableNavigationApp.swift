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
    
    let networkService: NetworkManager = LiveNetworkManager()
    
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
                moodViewProvider: { return MoodView(viewModel: MoodViewModel()) },
                goalsViewProvider: { return GoalsView() }
            ).erased
        }
    }
    
    var profileTabProvider: TabViewProvider {
        return .init(
            systemImageName: "person.circle.fill",
            tabName: "Profile"
        ) {
            return ProfileView(
                    networkService: ProfileManagerService(
                        networkManager: self.networkService
                )
            ).erased
        }
    }
}

extension View {
    var erased: AnyView {
        return AnyView(self)
    }
}

extension LiveNetworkManager: ProfileService {
    func retrieveProfile() -> String {
        return get(key: "profile")
    }
}

struct ProfileManagerService: ProfileService {
    let networkManager: NetworkManager
    
    func retrieveProfile() -> String {
        return self.networkManager.get(key: "profile")
    }
}

// protocol NetworkManager {}
// protocol UserPreferencesManager {}

enum UserPreferences {
    
    static var coreData: UserPreferencesManager {
        return CoreDataUserPreferencesManager()
    }
    
    static var userDefaults: UserPreferencesManager {
        return UserDefaultsUserPreferencesManager()
    }
    
    static var file: UserPreferencesManager {
        return FileUserPreferencesManager()
    }
    
    private struct CoreDataUserPreferencesManager: UserPreferencesManager {}
    
    private struct FileUserPreferencesManager: UserPreferencesManager {}
    
    private struct UserDefaultsUserPreferencesManager: UserPreferencesManager {}
}
protocol UserPreferencesManager {}

class SomeDependency {
    let userPreferencesManager: UserPreferencesManager
    
    init(userPreferencesManager: UserPreferencesManager = UserPreferences.file) {
        self.userPreferencesManager = userPreferencesManager
    }
}
