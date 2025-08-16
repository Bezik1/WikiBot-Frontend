//
//  ContentView.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 14/08/2025.
//

import SwiftUI

struct WikiBotView: View {
    @StateObject var viewModel = WikiBotViewModel()
    @State private var isSidebarExpanded = false
    @State private var isAddingNewNote = false
    @State private var newNoteName = ""

    var body: some View {
        HStack(spacing: 0) {
            SidebarView(
                viewModel: viewModel,
                isSidebarExpanded: $isSidebarExpanded,
                isAddingNewNote: $isAddingNewNote,
                newNoteName: $newNoteName
            )
            ChatView(
                viewModel: viewModel,
                isSidebarExpanded: isSidebarExpanded
            )
        }
        .frame(width: 850, height: 500)
    }
}



struct WikiBotView_Previews: PreviewProvider {
    static var previews: some View {
        WikiBotView()
    }
}
