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
    let content: String
    let emotion: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case emotion
    }
}

struct Journals: Codable {
    let journals: [Journal]
}
