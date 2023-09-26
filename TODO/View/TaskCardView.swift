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
        HStack(alignment: .top) {
            Button(action: {
                isOn.toggle()
            }, label: {
                Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
            })
            .offset(y: 5)
            VStack(alignment: .leading) {
                HStack {
                    Text(task.taskName)
                        .font(.title2)
                        .foregroundColor(isOn ? .gray : .blue)
                    .strikethrough(isOn)
                
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(task.tags) { tag in
                                TagView(tag: tag)
                            }
                        }
                    }
                    .scaleEffect(0.8)
                    .offset(x:20)
                }
                Text("Due Date: \(task.dueDate.formatted(date: .long, time: .omitted))")
                    .foregroundColor(.gray)
            }
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
