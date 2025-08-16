//
//  ChatView.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: WikiBotViewModel
    var isSidebarExpanded: Bool

    var body: some View {
        VStack {
            ChatMessagesSection(viewModel: viewModel, isLoading: $viewModel.isLoading)

            if viewModel.currentNavbarElement != nil {
                ChatInputSection(
                    question: $viewModel.question,
                    isLoading: viewModel.isLoading,
                    onSend: {
                        Task {
                            do { try await viewModel.sendQuestion() }
                            catch { print("Failed to send question: \(error)") }
                        }
                    }
                )
            }
        }
        .frame(width: isSidebarExpanded ? 600 : 800, height: 500)
        .background(Color.section)
    }
}
