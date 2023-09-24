//
//  Task.swift
//  TODO
//
//  Created by Charles He on 9/19/23.
//

import Foundation

struct Task: Identifiable {
    let id: UUID
    var taskName: String
    
    init(id: UUID = UUID(), taskName: String) {
        self.id = id
        self.taskName = taskName
    }
}

extension Task {
    static var sampleTasks: [Task] = [
        Task(taskName: "Call DMV"),
        Task(taskName: "Do HW"),
        Task(taskName: "Do Laundry"),
    ]
}
