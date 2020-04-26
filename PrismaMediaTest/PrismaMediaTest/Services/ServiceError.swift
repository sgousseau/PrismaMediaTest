//
//  ServiceError.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import Foundation

/*
 L'énumération ServiceError permet d'encapsuler l'ensemble des erreurs relatives aux services 
 */
enum ServiceError: Error {
    case notImplemented(service: String)
}
