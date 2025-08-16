//
//  HistoryElement.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 14/08/2025.
//
import Foundation

class NavbarElement: ObservableObject, Identifiable {
    let id: UUID
    var name: String
    @Published var historyElements: [HistoryElement]

    init(id: UUID = UUID(), name: String, historyElements: [HistoryElement] = []) {
        self.id = id
        self.name = name
        self.historyElements = historyElements
    }
}
