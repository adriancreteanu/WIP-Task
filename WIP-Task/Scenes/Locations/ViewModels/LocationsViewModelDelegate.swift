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
    
    var numberOfItems: Int { get }
    
    func itemFor(row: Int) -> Location
    
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
