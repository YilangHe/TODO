//
//  Tag.swift
//  TODO
//
//  Created by Charles He on 9/25/23.
//

import Foundation

struct Tag: Identifiable {
    let id: UUID
    var tagName: String
    var theme: Theme
    
    init(id: UUID = UUID(), tagName: String, theme: Theme) {
        self.id = id
        self.tagName = tagName
        self.theme = theme
    }
}

extension Tag {
    static var sampleTags: [Tag] = [
        Tag(tagName: "Important", theme: .orange),
        Tag(tagName: "Entertain", theme: .red)
    ]
}
