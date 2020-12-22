//
//  LocationViewDataType.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import Foundation

protocol LocationViewDataType {
    
    var address: String { get }
    
    var distance: String { get }
    
    var imageURL: URL? { get }
    
}
