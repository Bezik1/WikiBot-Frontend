//
//  ChatMessageBubble.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct ChatMessageBubble: View {
    let historyElement: HistoryElement

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if historyElement.author == "User" {
                HStack(spacing: 10) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Spacer()
                }
                .padding(12)
                .padding(.bottom, -12)
            } else {
                HStack(spacing: 10) {
                    Spacer()
                        Image("WikiBot Logo")
                            .resizable()
                            .imageScale(.medium)
                            .frame(width: 30, height: 30)
                }
                .padding(12)
                .padding(.bottom, -12)
            }

            Text(historyElement.text)
                .padding()
                .foregroundColor(.white)
                .lineLimit(nil)
        }
        .padding(8)
        .background(Color.background)
        .cornerRadius(10)
    }
}
