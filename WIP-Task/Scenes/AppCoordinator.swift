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
    
//    lazy var rootViewController: UINavigationController = {
//        return UINavigationController(rootViewController: UIViewController())
//    }()
    
//    let apiClient: ApiClient = {
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = ["Content-Type": "application/json; charset=utf-8"]
//        let apiClient = ApiClient(configuration: configuration)
//        return apiClient
//    }()
    
    // MARK: - Coordinator
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
//        guard let window = window else {
//            return
//        }
//        
        //window.rootViewController = rootViewController
        //window.makeKeyAndVisible()
        
        //goToLocations(from: rootViewController)
        showLocationsList()
    }
    
    override func finish() {
        
    }
}

extension AppCoordinator {
    
    func showLocationsList() {
        let locationsCoordinator = LocationsCoordinator(window: window)
        addChildCoordinator(locationsCoordinator)
        locationsCoordinator.start()
    }
    
//    func goToLocations(from controller: UINavigationController) {
//        let locationsCoordinator = LocationsCoordinator(rootViewController: controller)
//        addChildCoordinator(locationsCoordinator)
//        locationsCoordinator.start()
//    }
    
}
