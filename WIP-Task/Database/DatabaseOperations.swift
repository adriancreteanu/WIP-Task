//
//  DatabaseOperations.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import RealmSwift

protocol DatabaseOperations {
    
    func save<T>(object: T)
    
    func saveList<T>(objects: [T])
    
}

protocol RealmDatabaseOperations {
    
    func save<T>(object: T) where T : Object
    
    func saveList<T>(objects: [T]) where T : Object
    
    func getList<T>(class: T.Type) -> [T] where T : Object
    
}
