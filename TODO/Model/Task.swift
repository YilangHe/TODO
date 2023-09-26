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
    var dueDate: Date
    var tags: [Tag]
    
    init(id: UUID = UUID(), taskName: String, dueDate: Date, tags: [Tag] = []) {
        self.id = id
        self.taskName = taskName
        self.dueDate = dueDate
        self.tags = tags
    }
}

extension Task {
    static var sampleTasks: [Task] = [
        Task(taskName: "Call DMV", dueDate: Date.now, tags: Tag.sampleTags),
        Task(taskName: "Do HW", dueDate: Date.now),
        Task(taskName: "Do Laundry", dueDate: Date.now),
    ]
}
