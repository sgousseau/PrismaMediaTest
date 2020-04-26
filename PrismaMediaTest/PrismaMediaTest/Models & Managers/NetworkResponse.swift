//
//  NetworkResponse.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import Foundation

class NetworkResponse<T: Decodable>: Decodable {
    let data: T
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(T.self, forKey: CodingKeys.data)
    }
}
