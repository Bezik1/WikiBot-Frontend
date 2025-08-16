//
//  SidebarToggleButton.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct SidebarToggleButton: View {
    @Binding var isSidebarExpanded: Bool

    var body: some View {
        IconButton(
            systemImage: isSidebarExpanded ? "chevron.left" : "sidebar.left",
            action: { withAnimation { isSidebarExpanded.toggle() } }
        )
    }
}
