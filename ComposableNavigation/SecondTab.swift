//
//  SecondTab.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 11/11/21.
//

import Foundation
import SwiftUI
import TextField

struct SecondTabView: View {
    @State var content: String
    @State var copiedContent: String
    
    var body: some View {
        return NavigationView {
            Form {
                SwiftUI.TextField("Add text here", text: $copiedContent)
                    .foregroundColor(.red)
                CustomTextField("Add text here", text: $content, onCommit: {
                    self.copiedContent = self.content
                }).foregroundColor(.green)
            }
                .navigationTitle("User")
        }
    }
}

