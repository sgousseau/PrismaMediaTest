//
//  UserManager.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import Foundation

/*
 UserManager est la classe en charge de la gestion du téléchargement, sauvegarde et chargement, de l'ensemble des fonctionnalités et intéractions  relatives aux données utilisateur
 */
class UserManager {
    var user: User
    
    init() {
        user = User(firstName: "", lastName: "", avatarUrlString: "")
    }
    
    func get(completion: (User) -> Void) {
        completion(user)
    }
}
