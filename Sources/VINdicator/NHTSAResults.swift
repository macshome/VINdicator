//
//  NHTSAResults.swift
//  
//
//  Created by Josh Wisenbaker on 9/20/22.
//

struct NHTSAResults: Codable {
    let count: Int
    let message, searchCriteria: String
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case count = "Count"
        case message = "Message"
        case searchCriteria = "SearchCriteria"
        case results = "Results"
    }
}

// MARK: - Result
struct Result: Codable, Hashable {
    let value: String?
    let valueID: String?
    let variable: String
    let variableID: Int

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case valueID = "ValueId"
        case variable = "Variable"
        case variableID = "VariableId"
    }
}
