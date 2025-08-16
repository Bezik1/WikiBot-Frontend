//
//  NavbarList.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct NavbarList: View {
    let currentElementName: String
    let elements: [NavbarElement]
    let onSelect: (NavbarElement) -> Void

    var body: some View {
        VStack(spacing: 10) {
            ForEach(elements) { element in
                Button(action: { onSelect(element) }) {
                    HStack(alignment: .top) {
                        Text(element.name)
                            .foregroundStyle(currentElementName == element.name ? .white : .gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}
