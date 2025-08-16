//
//  NewNoteSection.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct NewNoteSection: View {
    @Binding var isAddingNewNote: Bool
    @Binding var newNoteName: String
    @ObservedObject var viewModel: WikiBotViewModel

    private func onSend() {
        guard !newNoteName.isEmpty else { return }
        let newNote = NavbarElement(id: UUID(), name: newNoteName, historyElements: [])
        viewModel.navbarElements.append(newNote)
        viewModel.currentNavbarElement = newNote
        newNoteName = ""
        isAddingNewNote = false
    }
    
    private func open() {
        withAnimation { isAddingNewNote = true }
    }
    
    var body: some View {
        HStack {
            if isAddingNewNote {
                TextField("Enter note name", text: $newNoteName)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(5)
                    .frame(width: 150, height: 50)
                    .foregroundColor(.white)
                
                IconButton(
                    systemImage: "paperplane",
                    action: onSend
                )
                .disabled(viewModel.isLoading)
                .buttonStyle(PlainButtonStyle())
                .padding(.leading, 30)
            } else {
                Button {
                    open()
                } label: {
                    HStack {
                        IconButton(
                            systemImage: "square.and.pencil",
                            action: {}
                        )
                        Text("New Note")
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.bottom, 50)
    }
}
