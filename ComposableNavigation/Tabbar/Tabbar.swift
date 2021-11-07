//
//  ContentView.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI

struct TabViewProvider {
    var systemImageName: String
    var tabName: String
    var viewProvider: () -> AnyView
}

struct Tabbar: View {
    var tabProviders: [TabViewProvider]
    
    var body: some View {
        TabView {
            ForEach(tabProviders, id: \.tabName) { tabProvider in
                tabProvider.viewProvider()
                    .tabbarItem(
                        systemImageName: tabProvider.systemImageName,
                        tabName: tabProvider.tabName
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Tabbar(
            tabProviders: [
                .init(
                    systemImageName: "hear.circle.fill",
                    tabName: "journal",
                    viewProvider: { return AnyView(Text("First Tab"))}
                ),
                .init(
                    systemImageName: "person.circle.fill",
                    tabName: "profile",
                    viewProvider: { return AnyView(Text("Second Tab"))}
                )
                
            ]
        )
    }
}
