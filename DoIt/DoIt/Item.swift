//
//  Item.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/8/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
