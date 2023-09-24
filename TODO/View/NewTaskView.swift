//
//  NewTaskView.swift
//  TODO
//
//  Created by Charles He on 9/19/23.
//

import SwiftUI

struct NewTaskView: View {
    @State private var newTaskName = ""
    @State private var dueDate = Date.now
    @State private var showingAlert = false
    @Binding var taskList: [Task]
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    TextField("Task Name", text: $newTaskName)
                    DatePicker(selection: $dueDate,
                               in: Date.now...,
                           displayedComponents: .date) {
                        Text("Select Due Date")
                    }
                }
                
                Button(action: {
                    print("Add Clicked")
                    print(taskList)
                    addNewTask(withName: newTaskName, withDueDate: dueDate)
                    newTaskName = ""
                    print(taskList)
                }) {
                    Text("Add")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .disabled(newTaskName.isEmpty)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Success"), dismissButton: .default(Text("Done")))
                }
            }
            .navigationTitle("Create New Task")
        }
    }
     
    func addNewTask(withName newTaskName: String, withDueDate dueDate: Date) {
        let newTask = Task(taskName: newTaskName, dueDate: dueDate)
        taskList.append(newTask)
        showingAlert = true
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let taskList = Task.sampleTasks
        
        NewTaskView(taskList: .constant(taskList))
    }
}
