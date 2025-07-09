//
//  DoItDetailView.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/9/25.
//
import SwiftUI

// Detailed editor for an existing Do It item
struct DoItDetailView: View {
    @ObservedObject var viewModel: DoItDetailViewModel
    
    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Title", text: $viewModel.item.title)
            }
            Section(header: Text("Details")) {
                Toggle("Completed", isOn: $viewModel.item.isCompleted)
                DatePicker("Due Date", selection: Binding(get: {
                    viewModel.item.dueDate ?? Date()
                }, set: { newDate in
                    viewModel.item.dueDate = newDate
                }), displayedComponents: [.date, .hourAndMinute])
                Picker("Priority", selection: $viewModel.item.priority) {
                    ForEach(DoItPriority.allCases, id: \ .rawValue) { pr in
                        Text(pr.description).tag(pr)
                    }
                }
                Toggle("Flagged", isOn: $viewModel.item.isFlagged)
                TextEditor(text: Binding(get: {
                    viewModel.item.notes ?? ""
                }, set: { viewModel.item.notes = $0 }
                                        ))
                .frame(minHeight: 100)
            }
        }
        .navigationTitle("Edit Do It")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    viewModel.saveChanges()
                }
            }
        }
    }
}
