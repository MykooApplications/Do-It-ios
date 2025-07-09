//
//  DoItRowView.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/9/25.
//

import SwiftUI

// A single row in the Do It list
struct DoItRowView: View {
    let item: DoItItem
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    // In production, you'd call viewModel.toggleCompletion
                }
            VStack(alignment: .leading) {
                Text(item.title)
                    .strikethrough(item.isCompleted)
                if let due = item.dueDate {
                    Text(due, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            if item.isFlagged {
                Image(systemName: "flag.fill")
                    .foregroundColor(.red)
            }
        }
    }
}
