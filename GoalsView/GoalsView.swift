//
//  GoalsView.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 06/11/21.
//

import SwiftUI
import TextField
import Combine
import UIKit

// MARK: - Model
struct Goal: Identifiable {
    var id: UUID
    var content: String
}

// MARK: - SwiftUI View
public struct GoalsView: View {
    @State var goals: [Goal] = [Goal(id: UUID(), content: "")]
    @FocusState private var focusedGoal: UUID?
    
    public init() { }
    
    // MARK: Body
    public var body: some View {
        VStack {
            self.title
            self.instructions
            self.form
        }
        .navigationBarTitle("Goals")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: self.swizzle)
        .onDisappear(perform: self.swizzle)
    }
    
    // MARK: Title View
    var title: some View {
        Text("What do you want achieve today?")
            .font(.title2)
    }
    
    // MARK: Instruction View
    var instructions: some View {
        Text("Writing down some goals for the day helps you stay focused and work toward them. Try to find at least 3 goals.")
            .font(.subheadline)
            .padding()
    }
    
    // MARK: Form View
    var form: some View {
        Form {
            ForEach($goals) { goal in
                TextField(
                    "Type your goal here...",
                    text: goal.content,
                    onCommit: {
                        self.addNewGoal(after: goal.wrappedValue)
                    }
                )
                .focused($focusedGoal, equals: goal.id)
                .onReceive(UITextField.deletePublisher, perform: { deleteInput in
                    self.deleteDetected(for: deleteInput)
                })
            }
        }
    }
    
    // MARK: Logic
    
    /// Adds a new empty goal after a given goal
    /// - Parameter goal: the currently focused goal. Used to decide whether we have to add a new goal or not.
    func addNewGoal(after goal: Goal) {
        guard
            let last = goals.last,
            last.id == goal.id
        else {
            return
        }
        
        let newGoal = Goal(id: UUID(), content: "")
        self.goals.append(newGoal)
        RunLoop.current.run(until: Date())
        self.focusedGoal = newGoal.id
    }
    
    /// It handles a deletion event.
    /// - Parameter deleteInput: the input for the deletion event. It can be used to decide what to do.
    func deleteDetected(for deleteInput: UITextField.DeletePressedEvent) {
        guard
            deleteInput.textBefore.isEmpty,
            deleteInput.textAfter.isEmpty,
            let index = self.goals.firstIndex(where: { $0.id == focusedGoal }),
            goals.count > 1
        else {
            return
        }
        
        self.goals.remove(at: index)
        RunLoop.current.run(until: Date())
        self.focusedGoal = index == 0 ? goals[0].id : goals[index - 1].id
    }
    
    /// Method that swizzle the bodies of the `deleteBackward` and `swizzle_deleteBackward` methods
    func swizzle() {
        guard
            let oldInstanceMethod = class_getInstanceMethod(UITextField.self, #selector(UITextField.deleteBackward)),
            let newInstanceMethod = class_getInstanceMethod(UITextField.self, #selector(UITextField.swizzled_deleteBackward))
        else {
            return
        }
        
        method_exchangeImplementations(oldInstanceMethod, newInstanceMethod)
    }
}

// MARK: - UITextField Extension
extension UITextField {
    
    /// The data model for a deleteion event.
    struct DeletePressedEvent {
        let textBefore: String
        let textAfter: String
    }
    
    /// Passthrough publisher that fires everytime a `deleteBackward` event is detected
    static let deletePublisher = PassthroughSubject<DeletePressedEvent, Never>()
    
    /// Method that captures the content of the `UITextField` before and after the delete button is pressed
    /// and then it asks the publisher to `send` an event.
    ///
    /// - Note: the call of `self.swizzled_deleteBackward()` is not a recursive call. After the swizzle happens the body of the`swizzled_deleteBackward` is the default body of the `deleteBackward`
    /// - Warning: never call this method directly.
    @objc fileprivate func swizzled_deleteBackward() {
        let before = self.text ?? ""
        self.swizzled_deleteBackward()
        let after = self.text ?? ""
        
        Self.deletePublisher.send(.init(textBefore: before, textAfter: after))
    }
}


// MARK: - SwiftUI Preview
struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
