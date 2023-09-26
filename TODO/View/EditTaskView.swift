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
    @State var previousTaskName = ""
    @State var previousDueDate = Date.now
    
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    TextField(task.taskName, text: $task.taskName)
                    DatePicker(selection: $task.dueDate,
                               in: Date.now...,
                           displayedComponents: .date) {
                        Text("Select Due Date")
                    }
                }
            }
            .navigationTitle("Edit Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        task.taskName = previousTaskName
                        task.dueDate = previousDueDate
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
        .task {
            // cache the previous task name for dismiss btn
            previousTaskName = task.taskName
            
            previousDueDate = task.dueDate
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTask = Task.sampleTasks[0]
        EditTaskView(task: .constant(sampleTask), isPresentingEditTaskView: .constant(true))
    }
}
