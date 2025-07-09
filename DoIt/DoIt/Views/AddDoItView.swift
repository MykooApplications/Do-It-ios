//
//  AddDoItView.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/9/25.
//

import SwiftUI

// View to add a new Do It item using natural-language parsing
struct AddDoItView: View {
    @EnvironmentObject var listVM: DoItListViewModel
    @Binding var isPresented: Bool
    @State private var inputText: String = ""
    @State private var parsedDate: Date?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Do It")) {
                    TextField("What to do?", text: $inputText, onCommit: parseInput)
                }
                Section(header: Text("Parsed Date")) {
                    if let date = parsedDate {
                        DatePicker("Due", selection: Binding(get: { date }, set: { parsedDate = $0 }), displayedComponents: [.date, .hourAndMinute])
                    } else {
                        Text("No date detected")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("New Do It")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { isPresented = false }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let item = DoItItem(title: inputText,
                                            dueDate: parsedDate,
                                            isFlagged: false,
                                            priority: .none)
                        listVM.add(item)
                        isPresented = false
                    }
                    .disabled(inputText.isEmpty)
                }
            }
        }
    }
    
    // Use NSDataDetector to find a date in the user's input
    private func parseInput() {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
        let range = NSRange(inputText.startIndex..<inputText.endIndex, in: inputText)
        if let match = detector?.firstMatch(in: inputText, options: [], range: range), let date = match.date {
            parsedDate = date
        } else {
            parsedDate = nil
        }
    }
}
