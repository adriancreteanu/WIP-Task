//
//  RealmLocation.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import RealmSwift

class RealmLocation: Object, Location {
    @objc dynamic var id: String = ""
    @objc dynamic var imageStringURL: String = ""
    @objc dynamic var label: String = ""
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    @objc dynamic var address = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static func make(location: Location) -> RealmLocation {
        let realmLocation = RealmLocation()
        realmLocation.id = UUID().uuidString
        realmLocation.address = location.address
        realmLocation.imageStringURL = location.imageStringURL
        realmLocation.label = location.label
        realmLocation.latitude = location.latitude
        realmLocation.longitude = location.longitude
        return realmLocation
    }
}
