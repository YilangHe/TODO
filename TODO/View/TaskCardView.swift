//
//  TaskCardView.swift
//  TODO
//
//  Created by Charles He on 9/19/23.
//

import SwiftUI

struct TaskCardView: View {
    var task: Task
    @State var isOn: Bool = false
    var body: some View {
        HStack {
            Button(action: {
                isOn.toggle()
            }, label: {
                Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
            })
            Text(task.taskName)
                .font(.title2)
                .foregroundColor(isOn ? .gray : .blue)
                .strikethrough(isOn)
            Spacer()
        }
        .padding()
    }
}

struct TaskCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTask: Task = Task.sampleTasks[0]
        TaskCardView(task: sampleTask)
    }
}
