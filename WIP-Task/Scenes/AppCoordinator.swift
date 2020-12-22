//
//  AppCoordinator.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 20.12.2020.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow?
    
    // MARK: - Coordinator
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        showLocationsList()
    }
    
    override func finish() {
        // Perform cleanup
    }
}

extension AppCoordinator {
    
    func showLocationsList() {
        let locationsCoordinator = LocationsCoordinator(window: window)
        addChildCoordinator(locationsCoordinator)
        locationsCoordinator.start()
    }

}
