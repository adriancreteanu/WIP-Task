//
//  RealmDatabase.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import Foundation
import RealmSwift

struct RealmDatabase: RealmDatabaseOperations {

    static var sharedInstance = RealmDatabase()
    
    var realm: Realm!
    
    private init() {
        self.realm = try! Realm()
    }
    
    func save<T>(object: T) where T : Object {
        try! realm.write {
            realm.add(object, update: .all)
        }
    }
    
    func saveList<T>(objects: [T]) where T : Object {
        for object in objects {
            try! realm.write {
                realm.add(object)
            }
        }
    }
    
    func getList<T>(class: T.Type) -> [T] where T : Object {
        return realm.objects(T.self).map { $0 }
    }
}
