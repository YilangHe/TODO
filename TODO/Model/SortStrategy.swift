//
//  SortStrategy.swift
//  TODO
//
//  Created by Charles He on 9/24/23.
//

import Foundation

enum SortStrategy: String, CaseIterable {
    case sortedByDueDate
    case sortedByAddedDate
    
    var name: String {
        rawValue.capitalized
    }
}
