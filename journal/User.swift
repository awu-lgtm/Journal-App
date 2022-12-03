//
//  User.swift
//  journal
//
//  Created by Allen Wu on 12/2/22.
//

import Foundation

class User: Decodable {
    let session: String
    
    enum CodingKeys: String, CodingKey {
        case session
    }
}
