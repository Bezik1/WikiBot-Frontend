//
//  ChatMessagesSection.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct ChatMessagesSection: View {
    @ObservedObject var viewModel: WikiBotViewModel
    @Binding var isLoading: Bool

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 25) {
                    Spacer()
                    if let currentElement = viewModel.currentNavbarElement {
                        ForEach(currentElement.historyElements) { historyElement in
                            ChatMessageBubble(historyElement: historyElement)
                                .id(historyElement.id)
                        }
                        if isLoading {
                            ChatMessageBubble(
                                historyElement: HistoryElement(
                                    author: "WikiBot",
                                    text: "Loading..."
                                )
                            )
                            .id("loading")
                        }
                    } else {
                        VStack {
                            Text("You didn't select note")
                                .foregroundColor(.gray)
                        }
                        .frame(width: 500, height: 300, alignment: .center)
                    }
                }
                .padding()
            }
            .onChange(of: viewModel.currentNavbarElement?.historyElements.count) { _ in
                scrollToLast(proxy: proxy)
            }
            .onChange(of: isLoading) { _ in
                scrollToLast(proxy: proxy)
            }
        }
        .frame(width: 550, height: 380, alignment: .top)
    }

    private func scrollToLast(proxy: ScrollViewProxy) {
        DispatchQueue.main.async {
            if isLoading {
                proxy.scrollTo("loading", anchor: .bottom)
            } else if let lastId = viewModel.currentNavbarElement?.historyElements.last?.id {
                proxy.scrollTo(lastId, anchor: .bottom)
            }
        }
    }
}
