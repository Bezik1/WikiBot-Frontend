//
//  LabelView.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct LabelView: View {
    let systemImage: String
    let text: String

    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .frame(width: 20, height: 20)
                .imageScale(.large)
                .foregroundColor(.gray)
            Text(text)
                .foregroundColor(.gray)
        }
    }
}
