//
//  ResponseModel.swift
//  WikiBot
//
//  Created by MacBook Mateusz Adamowicz on 12/08/2025.
//

import Foundation

struct APIResponse: Codable {
    let status: Int
    let message: String
    let data: Data?
}

struct Data: Codable {
    let answer: String
}
