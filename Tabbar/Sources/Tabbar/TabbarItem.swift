//
//  TabbarItem.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI

struct TabbarItem: View {
    let systemImageName: String
    let tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemImageName)
            Text(tabName)
        }
    }
}

struct TabbarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabbarItem(systemImageName: "pc", tabName: "a tab")
    }
}

extension View {
    func tabbarItem(
        systemImageName: String,
        tabName: String
    ) -> some View {
        self.tabItem {
            TabbarItem(
                systemImageName: systemImageName,
                tabName: tabName
            )
        }
    }
}
