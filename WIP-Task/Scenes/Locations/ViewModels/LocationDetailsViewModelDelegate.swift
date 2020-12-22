//
//  LocationDetailsViewModelDelegate.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import Foundation

protocol LocationDetailsViewModelDelegate {
    
    var viewDelegate: LocationDetailsViewModelViewDelegate? { get set }
    
}

protocol LocationDetailsViewModelViewDelegate: class {
    
    func updateScreen(location: Location)
    
}
