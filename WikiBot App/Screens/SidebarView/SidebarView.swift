//
//  SidebarView.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct SidebarView: View {
    @ObservedObject var viewModel: WikiBotViewModel
    @Binding var isSidebarExpanded: Bool
    @Binding var isAddingNewNote: Bool
    @Binding var newNoteName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            SidebarHeader(
                isSidebarExpanded: $isSidebarExpanded
            )

            if isSidebarExpanded {
                NewNoteSection(
                    isAddingNewNote: $isAddingNewNote,
                    newNoteName: $newNoteName,
                    viewModel: viewModel
                )

                SidebarSectionTitle(title: "Chats")

                NavbarList(
                    currentElementName: viewModel.currentNavbarElement?.name ?? "",
                    elements: viewModel.navbarElements,
                    onSelect: { element in
                        viewModel.currentNavbarElement = element
                    }
                )

                Spacer()
            }

            SidebarToggleButton(
                isSidebarExpanded: $isSidebarExpanded
            )
        }
        .padding(20)
        .frame(width: isSidebarExpanded ? 250 : 75, height: 500, alignment: .top)
        .background(Color.background)
    }
}
