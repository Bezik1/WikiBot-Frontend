//
//  SidebarSectionTitle.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct SidebarSectionTitle: View {
    let title: String

    var body: some View {
        Text(title)
            .foregroundStyle(Color(.gray))
    }
}
