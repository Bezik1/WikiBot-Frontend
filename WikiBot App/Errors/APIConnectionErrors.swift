//
//  APIErrors.swift
//  WikiBot
//
//  Created by MacBook Mateusz Adamowicz on 12/08/2025.
//
import Foundation

enum APIConnectionErrors: LocalizedError {
    case invalidURL
    case noData
    case serverError(message: String)
    case decodingFailed(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Wrong URL."
        case .noData:
            return "No response from the server."
        case .serverError(let message):
            return "Internal Server Error: \(message)"
        case .decodingFailed(let error):
            return "Data decoding error: \(error.localizedDescription)"
        case .networkError(let error):
            return "Network Error: \(error.localizedDescription)"
        }
    }
}
