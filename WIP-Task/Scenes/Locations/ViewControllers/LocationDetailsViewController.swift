//
//  LocationDetailsViewController.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import UIKit

class LocationDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: LocationDetailsViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        viewModel.start()
    }
    
    func setup() {
        view.backgroundColor = .green
    }
    
    // MARK: - Actions
    
    
}

extension LocationDetailsViewController: LocationsViewModelViewDelegate {
    
    func updateScreen() {
        
    }
}
