//
//  Theme.swift
//  TODO
//
//  Created by Charles He on 9/25/23.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case red
    case orange
    case blue
    case green
    case purple
    case gray
    
    
    var mainColor: Color {
        switch self {
        case .red:
            return Color.red
        case .orange:
            return Color.orange
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        case .gray:
            return Color.gray
        }
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}
