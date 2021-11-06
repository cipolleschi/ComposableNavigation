//
//  MoodCell.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI

struct MoodCell: View {
    let content: String
    var body: some View {
        Text(content)
            .font(.caption2)
            .padding()
            .overlay(
                Rectangle()
                    .strokeBorder()
                    .foregroundColor(Color.green))
    }
}

struct MoodCell_Previews: PreviewProvider {
    static var previews: some View {
        MoodCell(content: "Some content")
    }
}
