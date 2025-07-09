//
//  DoItDetailViewModel.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/9/25.
//
import Foundation
import Combine

// ViewModel for editing or viewing a single Do It item
class DoItDetailViewModel: ObservableObject {
    @Published var item: DoItItem
    private let service = DoItService()
    private var listVM: DoItListViewModel
    
    init(item: DoItItem, listVM: DoItListViewModel) {
        self.item = item
        self.listVM = listVM
    }
    
    // Save changes back to shared list
    func saveChanges() {
        if let idx = listVM.items.firstIndex(where: { $0.id == item.id }) {
            listVM.items[idx] = item
            service.save(listVM.items)
        }
    }
}
