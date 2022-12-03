//
//  User.swift
//  journal
//
//  Created by Allen Wu on 12/2/22.
//

import Foundation

class User: Decodable {
    let session_token: String
    
    enum CodingKeys: String, CodingKey {
        case session_token
    }
}
