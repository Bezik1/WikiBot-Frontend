//
//  IconButton.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct IconButton: View {
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .frame(width: 20, height: 20)
                .imageScale(.large)
                .foregroundColor(.white)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
