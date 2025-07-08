//
//  DoItViewModel.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/8/25.
//

import Foundation
import Combine

// ViewModel for the main list of Do It items
class DoItListViewModel: ObservableObject {
    @Published var items: [DoItItem] = []
    private let service = DoItService()

    init() {
        loadItems()
    }

    // Load from persistence and publish
    func loadItems() {
        items = service.load()
    }

    // Add a new item and persist
    func add(_ item: DoItItem) {
        items.append(item)
        save()
    }

    // Remove items at specified offsets
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    // Reorder items in the list
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
        save()
    }

    // Toggle completion state
    func toggleCompletion(_ item: DoItItem) {
        guard let idx = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[idx].isCompleted.toggle()
        save()
    }

    // Persist current items
    private func save() {
        service.save(items)
    }
}
