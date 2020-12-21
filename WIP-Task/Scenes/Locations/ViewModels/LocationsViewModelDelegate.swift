//
//  LocationsViewModelDelegate.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 21.12.2020.
//

import UIKit

protocol LocationsViewModelDelegate {
    
    var viewDelegate: LocationsViewModelViewDelegate? { get set }
    
    // Data Source
    
    func numberOfItems() -> Int
    
    //func itemFor(row: Int) ->
    
    // Events
    
    func start()
    
    func didSelectRowAt(_ row: Int, from controller: UIViewController)
    
}

protocol LocationsViewModelCoordinatorDelegate: class {
    
    func didSelect(from controller: UIViewController)
}

protocol LocationsViewModelViewDelegate: class {
    
    func updateScreen()
    
}
