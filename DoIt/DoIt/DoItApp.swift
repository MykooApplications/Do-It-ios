//
//  DoItApp.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/8/25.
//

import SwiftUI
import SwiftData

@main
struct DoItApp: App {
    // Shared view model for the entire app
    @StateObject private var listViewModel = DoItListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                DoItListView()
                    .environmentObject(listViewModel)
            }
        }
    }
}
