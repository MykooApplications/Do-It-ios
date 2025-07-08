//
//  DoItItem.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/8/25.
//

import Foundation

// Represents a single "Do It" item
struct DoItItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var dueDate: Date?          // Optional due date
    var isFlagged: Bool         // User can flag for importance
    var priority: DoItPriority
    var notes: String?          // Additional notes
    var isCompleted: Bool       // Completion state
    
    init(
        id: UUID = UUID(),
        title: String,
        dueDate: Date? = nil,
        isFlagged: Bool = false,
        priority: DoItPriority = .none,
        notes: String? = nil,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.isFlagged = isFlagged
        self.priority = priority
        self.notes = notes
        self.isCompleted = isCompleted
    }
}

// Priority levels mirror Apple Reminders' low/medium/high
enum DoItPriority: Int, CaseIterable, Codable {
    case none = 0, low, medium, high
    
    // User-friendly description
    var description: String {
        switch self {
        case .none:   return "None"
        case .low:    return "Low"
        case .medium: return "Medium"
        case .high:   return "High"
        }
    }
}
