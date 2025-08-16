//
//  SidebarHeader.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct SidebarHeader: View {
    @Binding var isSidebarExpanded: Bool

    var body: some View {
        HStack(alignment: .center) {
            Image("WikiBot Logo")
                .imageScale(.large)
                .frame(width: 20, height: 20)
                .padding(.leading, 2)
                .padding(.trailing, isSidebarExpanded ? 0 : -40)
            if isSidebarExpanded {
                Spacer()
                IconButton(
                    systemImage: "sidebar.left",
                    action: { withAnimation { isSidebarExpanded.toggle() } }
                )
            }
        }
        .padding(.bottom, 30)
    }
}
