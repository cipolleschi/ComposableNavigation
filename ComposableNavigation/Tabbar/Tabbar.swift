//
//  ContentView.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView {
            JournalView()
                .tabbarItem(
                    systemImageName: "heart.circle.fill",
                    tabName: "Journal"
                )
            
            Text("Second Tab")
                .tabbarItem(
                    systemImageName: "person.circle.fill",
                    tabName: "Profile"
                )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
