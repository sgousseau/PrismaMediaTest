//
//  UserManager.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import Foundation

/*
 UserManager est la classe en charge de la gestion du téléchargement, sauvegarde et chargement relatives aux données utilisateur
 */
class UserManager {
    let network = DefaultNetworkService()
    let storage = DefaultStorageService()
    
    enum Keys: String {
        case user = "user_storage_key"
    }
    
    var user: User?
    
    init() {
        load()
    }
    
    func get(completion: @escaping (User) -> Void, error: ((Error) -> Void)? = nil) {
        if let user = user {
            completion(user)
            return
        }
        
        network.get(NetworkResponse<User>.self, route: "https://reqres.in/api/users/1") { (result) in
            switch result {
            case .success(let response):
                self.user = response.data
                self.save()
                completion(self.user!)
            case .failure(let err):
                error?(err)
            }
        }
    }
    
    private func save() {
        if let user = user {
            storage.save(encodable: user, key: Keys.user.rawValue)
        }
    }
    
    private func load() {
        user = storage.load(key: Keys.user.rawValue)
    }
}
