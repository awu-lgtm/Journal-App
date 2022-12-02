//
//  Journal.swift
//  journal
//
//  Created by Allen Wu on 11/27/22.
//

import Foundation

struct Journal: Codable {
    let id: Int
    let title: String
    let description: String
    let mood: String
    var favorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case mood
        case favorite
    }
}

struct Journals: Codable {
    let journals: [Journal]
}
