//
//  DoItService.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/8/25.
//

import Foundation

// Handles persistence of Do It items to disk using JSON
class DoItService {
    private let fileName = "doit_items.json"
    private var fileURL: URL {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docs.appendingPathComponent(fileName)
    }
    
    // Load items from disk; returns empty array on failure
    func load() -> [DoItItem] {
        do {
            let data = try Data(contentsOf: fileURL)
            let decoded = try JSONDecoder().decode([DoItItem].self, from: data)
            return decoded
        } catch {
            // File not found or decode error
            return []
        }
    }
    
    // Save items array back to disk
    func save(_ items: [DoItItem]) {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: fileURL, options: .atomicWrite)
        } catch {
            print("Error saving Do It items: \(error)")
        }
    }
}
