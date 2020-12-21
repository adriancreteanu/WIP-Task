//
//  LocationsViewModel.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 20.12.2020.
//

import UIKit

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
        getLocations()
    }
    
    func getLocations() {
        let response = service.getPlaces()
        
        if let locations = response.0 {
            self.locations = locations
        }
        
        viewDelegate?.updateScreen()
    }
    
}

extension LocationsViewModel: LocationsViewModelDelegate {
    
    
    
    // MARK: - Data source
    
    var numberOfItems: Int {
        return locations.count
    }
    
    func itemFor(row: Int) -> Location {
        return locations[row]
    }
    
    // MARK: - Events
    
    func didSelectRowAt(_ row: Int, from controller: UIViewController) {
        
    }
    
    
}
