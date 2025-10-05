//
//  Verb.swift
//  ConjugationApp
//
//  Created by Zeko Madson on 10/5/25.
//

import Foundation

class Verb: Identifiable, Codable {
    var id: String
    var spanishBase: String
    var englishBase: String
    
    init(id: String = UUID().uuidString, spanishBase: String, englishBase: String) {
        self.id = id
        self.spanishBase = spanishBase
        self.englishBase = englishBase
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case spanishBase
        case englishBase
    }
}
