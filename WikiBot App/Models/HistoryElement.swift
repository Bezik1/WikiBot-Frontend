//
//  HistoryElement.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 14/08/2025.
//
import Foundation

struct HistoryElement: Hashable, Identifiable {
    var id = UUID()
    
    var author: String
    var text: String
}

var sampleHistoryAuthorElement = HistoryElement(
    author: "User",
    text: "What caused ww?",
)

var sampleHistoryModelElement = HistoryElement(
    author: "WikiBot",
    text: "Personifications of Germany, France, Russia, Austria-Hungary, and the Kingdom attempting to keep the lid on the simmering cauldron of imperialist and nationalist tensions in the Balkans to prevent a general European war. They were successful in 1912 and 1913 but did not succeed in 1914. The causes of the war after the European nationalism played over the European nationalism spawned by the European nationalism spawned by",
)
