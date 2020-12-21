//
//  Location.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 21.12.2020.
//

import Foundation

protocol Location {
    
    var address: String { get }
    
    var imageStringURL: String? { get }
    
    var label: String { get }
    
    var latitude: Double { get }
    
    var longitude: Double { get }
    
}
