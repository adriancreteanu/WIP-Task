//
//  LocationsViewModel.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 20.12.2020.
//

import UIKit
import CoreLocation

class LocationsViewModel {
    
    // MARK: Delegates

    weak var coordinatorDelegate: LocationsViewModelCoordinatorDelegate?
    
    weak var viewDelegate: LocationsViewModelViewDelegate?
    
    // MARK: - Properties
    
    fileprivate var locations: [Location] = []
    
    fileprivate let service: LocationService
    
    // MARK: - Init
    
    init(service: LocationService) {
        self.service = service
    }
    
    func start() {
        let savedLocations = getDatabaseLocations()
        
        if savedLocations.isEmpty {
            self.getLocations()
        } else {
            self.locations = savedLocations
            viewDelegate?.updateScreen()
        }
    }
    
    func getDatabaseLocations() -> [Location] {
        return RealmDatabase.sharedInstance.getList(class: RealmLocation.self)
    }
    
    func getLocations() {
        let response = service.getPlaces()
        
        if let locations = response.0 {
            self.locations = locations
        }
        
        // Save locations in db
        
        var realmLocations: [RealmLocation] = []
        var id = 0
        
        locations.forEach {
            let realmLocation = RealmLocation()
            realmLocation.id = id
            realmLocation.address = $0.address
            realmLocation.imageStringURL = $0.imageStringURL
            realmLocation.label = $0.label
            realmLocation.latitude = $0.latitude
            realmLocation.longitude = $0.longitude
            realmLocations.append(realmLocation)
            
            id = id + 1
        }
        
        // Maybe perform this on another thread
        RealmDatabase.sharedInstance.saveList(objects: realmLocations)
        
        viewDelegate?.updateScreen()
    }
    
}

extension LocationsViewModel: LocationsViewModelDelegate {
    
    // MARK: - Data source
    
    var numberOfItems: Int {
        return locations.count
    }
    
    func itemFor(row: Int) -> LocationViewDataType {
        let location = locations[row]
        return LocationViewData(location: location)
    }
    
    // MARK: - Events
    
    func didSelectRowAt(_ row: Int, from controller: UIViewController) {
        let location = locations[row]
        coordinatorDelegate?.didSelect(location: location, from: controller)
    }
    
}
