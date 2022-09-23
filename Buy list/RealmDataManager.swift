//
//  RealmDataManager.swift
//  Buy list
//
//  Created by Иван Бегичев on 23.09.2022.
//

import Foundation
import RealmSwift

class RealmDataManager {
    
    static let shared = RealmDataManager()
    
    
    fileprivate lazy var mainRealm = try? Realm(configuration: .defaultConfiguration)
    
    func save(item: BuyListItem) {
        
        try? mainRealm?.write {
            mainRealm?.add(item)
        }
        
    }
    
    func delete(object: Object) {
        
        try? mainRealm?.write {
            mainRealm?.delete(object)
        }
        
    }
    
    func obtainItems() -> [BuyListItem] {
        
        let result = mainRealm?.objects(BuyListItem.self)
        
        return Array(result!) 
        
    }
    
}
