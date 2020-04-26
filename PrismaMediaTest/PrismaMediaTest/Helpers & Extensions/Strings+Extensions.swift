//
//  Strings+Extensions.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import Foundation

extension String {
    
    /*
     Convertit cette chaîne en URL
     */
    func toURL() -> URL? {
        return URL(string: self)
    }
}
