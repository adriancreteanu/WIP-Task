//
//  LocationDetailsViewModel.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import Foundation

class LocationDetailsViewModel {
    
    // MARK: - Delegates
    
    weak var coordinatorDelegate: LocationsViewModelCoordinatorDelegate?
    
    weak var viewDelegate: LocationsViewModelViewDelegate?
    
    // MARK: - Properties
    
    fileprivate var location: Location
    
    init(location: Location) {
        self.location = location
    }
    
    func start() {
        print(location)
    }
}
