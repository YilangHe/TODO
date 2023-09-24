//
//  ContentView.swift
//  TODO
//
//  Created by Charles He on 9/19/23.
//

import SwiftUI

struct TODOListView: View {
    @State var taskList: [Task] = Task.sampleTasks
    @State private var isPresentingNewTaskView: Bool = false
    @State private var isPresentingEditTaskView: Bool = false
    @State private var editingTaskIdx: Int = 0
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    ForEach($taskList) { $task in
                        TaskCardView(task: task)
                            .swipeActions {
                                Button(action: {
                                    print("on delete")
                                    deleteTask(withId: task.id)
                                }, label: {
                                    Image(systemName: "delete.left")
                                })
                                .tint(.red)
                                
                                Button(action: {
                                    editingTaskIdx = getTaskIndex(withId: task.id) ?? 0
                                    isPresentingEditTaskView = true
                                }, label: {
                                    Image(systemName: "info.circle")
                                })
                                .sheet(isPresented: $isPresentingEditTaskView) {
                                    Text("Edit")
                                }
                            }
                    }
                    NavigationLink(destination: NewTaskView(taskList: $taskList)) {
                        Text("Add New Task")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                .navigationTitle("TODO")
                .sheet(isPresented: $isPresentingEditTaskView) {
                    EditTaskView(task: $taskList[editingTaskIdx], isPresentingEditTaskView: $isPresentingEditTaskView)
                }
            }
        }
    }
    
    func getTaskIndex(withId id: UUID) -> Int? {
        return taskList.firstIndex(where: { $0.id == id })
    }
    
    func deleteTask(withId id: UUID) {
        if let index = getTaskIndex(withId: id) {
            print("delete taks \(index)")
            taskList.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TODOListView()
    }
}
