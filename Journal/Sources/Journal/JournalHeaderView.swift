//
//  JournalHeaderView.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI

struct JournalHeaderView<V: View>: View {
    let headerTitle: String
    let headerImage: String
    let destination: () -> V
    
    var body: some View {
        HStack {
            Text(headerTitle)
            Spacer()
            NavigationLink(destination: destination, label: {
                Image(systemName: headerImage)
            })
        }
    }
}

struct JournalHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        JournalHeaderView(
            headerTitle: "Title",
            headerImage: "arrow.right",
            destination: { return Text("Hello") }
        )
    }
}
