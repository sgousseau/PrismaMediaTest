//
//  User.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import Foundation

struct User: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var avatarUrlString: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case avatarUrlString = "avatar"
    }
}
