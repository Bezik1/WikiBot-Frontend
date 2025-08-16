//
//  WikiBotModelView.swift
//  WikiBot App
//
//  Created by MacBook Mateusz Adamowicz on 14/08/2025.
//

import SwiftUI
import Foundation

class WikiBotViewModel: ObservableObject {
    @Published var currentNavbarElement: NavbarElement? = nil
    @Published var question: String = ""
    @Published var navbarElements: [NavbarElement] = []
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    func sendQuestion() async {
        guard let currentElement = currentNavbarElement else {
            errorMessage = "No navbar element selected."
            return
        }
        
        let index = navbarElements.firstIndex(where: { $0.id == currentElement.id }) ?? navbarElements.count
        
        let newQuestionEntry = HistoryElement(id: UUID(), author: "User", text: question)
        if index < navbarElements.count {
            navbarElements[index].historyElements.append(newQuestionEntry)
        }
        
        defer { isLoading = false }
        isLoading = true
        do {
            let res = try await getAnswer()
            
            if let answer = res.data?.answer, !answer.isEmpty {
                let newAnswerEntry = HistoryElement(id: UUID(), author: "WikiBot", text: answer)
                
                if index < navbarElements.count {
                    navbarElements[index].historyElements.append(newAnswerEntry)
                    currentNavbarElement = navbarElements[index]
                }
            } else {
                errorMessage = "Server didn't respond correctly."
            }
        } catch {
            errorMessage = "Error: \(error.localizedDescription)"
        }
        
        isLoading = false
        question = ""
    }
    
    func getAnswer() async throws -> APIResponse {
        guard let url = URL(string: WIKI_URL) else { throw APIConnectionErrors.invalidURL }
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody = QuestionRequest(question: question)
        req.httpBody = try JSONEncoder().encode(requestBody)
        
        let (data, res) = try await URLSession.shared.data(for: req)
        
        guard let httpResponse = res as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIConnectionErrors.serverError(message: "Unexpected server status code")
        }
        guard !data.isEmpty else { throw APIConnectionErrors.noData }
        
        return try JSONDecoder().decode(APIResponse.self, from: data)
    }
}
