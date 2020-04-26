//
//  StorageService.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import Foundation

/*
 L'interface du service de sauvegarde et chargement
 */
protocol StorageService {
    @discardableResult
    func save<T>(encodable: T, key: String) -> Bool where T: Encodable
    
    @discardableResult
    func load<T>(key: String) -> T? where T: Decodable
}

/*
 Le StorageService par défaut
 */
typealias DefaultStorageService = UserDefaultStorage

/*
 L'implémentation du StorageService par utilisation du conteneur local (UserDefaults)
 */
class UserDefaultStorage: StorageService {
    
    private var container = UserDefaults.standard
    
    init() {}
    
    convenience init(container: UserDefaults) {
        self.init()
        self.container = container
    }
    
    @discardableResult
    func save<T>(encodable: T, key: String) -> Bool where T: Encodable {
        guard let encoding = try? JSONEncoder().encode(encodable) else {
            return false
        }
        self.container.set(encoding, forKey: key)
        self.container.synchronize()
        return true
    }
    
    @discardableResult
    func load<T>(key: String) -> T? where T: Decodable {
        if let data = self.container.object(forKey: key) as? Data {
            return try? JSONDecoder().decode(T.self, from: data)
        }
        
        return nil
    }
}
