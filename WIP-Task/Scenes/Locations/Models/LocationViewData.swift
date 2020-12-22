//
//  LocationViewData.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import Foundation
import CoreLocation

struct LocationViewData: LocationViewDataType {
    
    var address: String {
        return location.address
    }
    
    var distance: String {
        let myCoordsTM = CLLocation(latitude: 45.7489, longitude: 21.2087)
        let locationCoordinates = CLLocation(latitude: location.latitude, longitude: location.longitude)
        
        let distanceInMeters = myCoordsTM.distance(from: locationCoordinates)
        return String(distanceInMeters)
    }
    
    var imageStringURL: String {
        return location.imageStringURL ?? ""
    }
    
    private let location: Location
    
    init(location: Location) {
        self.location = location
    }
}
