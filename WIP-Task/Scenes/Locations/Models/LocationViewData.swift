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
        // TODO: Get user's real location using CLLocationManager
        let coordinatesTimisoara = CLLocation(latitude: 45.7489, longitude: 21.2087)
        let locationCoordinates = CLLocation(latitude: location.latitude, longitude: location.longitude)
        
        let distanceInMeters = coordinatesTimisoara.distance(from: locationCoordinates)
        let distanceInKM  = distanceInMeters / 1000
        return String(format: "%.2f km", distanceInKM)
    }
    
    var imageURL: URL? {
        return URL(string: location.imageStringURL)
    }
    
    private let location: Location
    
    init(location: Location) {
        self.location = location
    }
}
