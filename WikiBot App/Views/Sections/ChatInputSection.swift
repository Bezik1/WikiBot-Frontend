//
//  ChatInputSection.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct ChatInputSection: View {
    @Binding var question: String
    var isLoading: Bool
    var onSend: () -> Void

    var body: some View {
        HStack {
            TextFieldInput(
                placeholder: "Ask WikiBot a question",
                text: $question
            )
            IconButton(
                systemImage: "paperplane",
                action: onSend
            )
            .disabled(isLoading)
            .padding(.leading, 20)
        }
        .frame(width: 550, height: 50)
        .background(Color.input)
        .cornerRadius(15)
        .padding(20)
    }
}
