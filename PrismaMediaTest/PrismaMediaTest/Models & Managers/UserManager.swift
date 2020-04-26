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
    
    var user: User!
    
    init() {
        load()
    }
    
    func getUser(done: @escaping () -> Void, error: ((Error) -> Void)? = nil) {
        if user != nil {
            done()
            return
        }
        
        network.get(NetworkResponse<User>.self, route: "https://reqres.in/api/users/1") { (result) in
            switch result {
            case .success(let response):
                self.user = response.data
                self.save()
                done()
            case .failure(let err):
                error?(err)
            }
        }
    }
    
    func updateUser(firstName: String, lastName: String) {
        user.firstName = firstName.isEmpty ? user.firstName : firstName
        user.lastName = lastName.isEmpty ? user.lastName : lastName
        save()
    }
    
    private func save() {
        storage.save(encodable: user, key: Keys.user.rawValue)
    }
    
    private func load() {
        user = storage.load(key: Keys.user.rawValue)
    }
}
