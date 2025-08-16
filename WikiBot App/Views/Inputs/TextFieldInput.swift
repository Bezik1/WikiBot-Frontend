//
//  TextFieldInput.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 15/08/2025.
//

import SwiftUI

struct TextFieldInput: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(PlainTextFieldStyle())
            .padding(.leading, -10)
            .frame(width: 450, height: 50)
            .foregroundColor(.white)
    }
}
