//
//  ListCoordinator.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 20.12.2020.
//

import UIKit

class LocationsCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let rootNavigationController = UINavigationController()
      
    let window: UIWindow?
    
    // MARK: VM / VC's
    
    var locationsViewModel: LocationsViewModel {
        let locationsService = LocationApiService()
        let viewModel = LocationsViewModel(service: locationsService)
        viewModel.coordinatorDelegate = self
        return viewModel
    }
    
    // MARK: - Coordinator

    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        let locationsVC = LocationsViewController()
        locationsVC.viewModel = locationsViewModel
        
        rootNavigationController.setViewControllers([locationsVC], animated: false)
        
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    
    }
    
    override func finish() {
        // Perform cleanup
    }
    
}

// MARK: - Navigation

extension LocationsCoordinator {
    
    func goToLocation(_ location: Location, from controller: UIViewController) {
        let detailsViewController = LocationDetailsViewController()
        let viewModel = LocationDetailsViewModel(location: location)
        viewModel.coordinatorDelegate = self
        detailsViewController.viewModel = viewModel
        
        rootNavigationController.pushViewController(detailsViewController, animated: true)
    }
}

// MARK: - ViewModels Callbacks

extension LocationsCoordinator: LocationsViewModelCoordinatorDelegate {
   
    func didSelect(location: Location, from controller: UIViewController) {
        goToLocation(location, from: controller)
    }

}
