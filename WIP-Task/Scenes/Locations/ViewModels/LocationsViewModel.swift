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
    
    // MARK: - Init
    
    func start() {
        getLocations()
    }
    
    func getLocations() {
        viewDelegate?.updateScreen()
    }
    
}

extension LocationsViewModel: LocationsViewModelDelegate {
    
    // MARK: - Data source
    
    func numberOfItems() -> Int {
        return 5
    }
    
    // MARK: - Events
    
    func didSelectRowAt(_ row: Int, from controller: UIViewController) {
        
    }
    
    
}
