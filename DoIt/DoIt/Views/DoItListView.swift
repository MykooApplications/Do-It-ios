//
//  DoItListView.swift
//  DoIt
//
//  Created by Roshan Mykoo on 7/9/25.
//
import SwiftUI

// Displays the list of Do It items
struct DoItListView: View {
    @EnvironmentObject var viewModel: DoItListViewModel
    @State private var showingAdd = false
    
    var body: some View {
        List {
            ForEach(viewModel.items) { item in
                NavigationLink(destination: DoItDetailView(
                    viewModel: DoItDetailViewModel(item: item, listVM: viewModel))) {
                        DoItRowView(item: item)
                    }
            }
            .onDelete(perform: viewModel.delete)
            .onMove(perform: viewModel.move)
        }
        .navigationTitle("Do It")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAdd.toggle() }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAdd) {
            AddDoItView(isPresented: $showingAdd)
        }
    }
}
