//
//  ListCoordinator.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 20.12.2020.
//

import UIKit

class LocationsCoordinator: Coordinator {
    
    // MARK: - Properties
    
    //let rootViewController: UINavigationController
    
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
    
//    init(rootViewController: UINavigationController) {
//        self.rootViewController = rootViewController
//    }
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        let locationsVC = LocationsViewController()
        locationsVC.viewModel = locationsViewModel
        
        rootNavigationController.setViewControllers([locationsVC], animated: false)
        
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        
        //rootViewController.pushViewController(locationsVC, animated: true)
    }
    
    override func finish() {
        //
    }
    
}

// MARK: - Navigation

extension LocationsCoordinator {
    
    func goToLocationDetails(from controller: UIViewController) {
        // TODO
    }
}

// MARK: - ViewModels Callbacks

extension LocationsCoordinator: LocationsViewModelCoordinatorDelegate {
   
    func didSelect(from controller: UIViewController) {
        goToLocationDetails(from: controller)
    }

}
