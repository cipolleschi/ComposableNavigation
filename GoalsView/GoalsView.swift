//
//  GoalsView.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI

public struct GoalsView: View {
    @State var goals: [String] = []
    @State var currentText: String = ""
    
    public init() {}
    
    public var body: some View {
        VStack {
            Text("What do you want achieve today?")
                .font(.title2)
            Text("Writing down some goals for the day helps you stay focused and work toward them. Try to find at least 3 goals.")
                .font(.subheadline)
                .padding()
            Form {
                ForEach(0..<goals.count + 1, id: \.self) { index in
                    TextField(
                        "Type your goal here...",
                        text: index >= goals.count ?
                            $currentText :
                            $goals[index],
                        onCommit: {
                            if index >= goals.count {
                                self.goals.append(self.currentText)
                                self.currentText = ""
                            }
                        }
                    )
                }.onDelete { indexSet in
                    self.goals.remove(atOffsets: indexSet)
                }
            }
        }
        .navigationBarTitle("Goals")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
