//
//  EditView.swift
//  TODO
//
//  Created by Charles He on 9/19/23.
//

import SwiftUI

struct EditTaskView: View {
    @Binding var task: Task
    @Binding var isPresentingEditTaskView: Bool
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    TextField(task.taskName, text: $task.taskName)
                }
                
            }
            .navigationTitle("Edit Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        isPresentingEditTaskView = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        isPresentingEditTaskView = false
                    }
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        var sampleTask = Task.sampleTasks[0]
        EditTaskView(task: .constant(sampleTask), isPresentingEditTaskView: .constant(true))
    }
}
