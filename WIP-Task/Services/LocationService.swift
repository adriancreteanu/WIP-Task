//
//  LocationService.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 21.12.2020.
//

import Foundation

protocol LocationService {
    
    func getPlaces() -> ([Location]?, Error?)
    
}

class LocationApiService: LocationService {
    
    func getPlaces() -> ([Location]?, Error?) {
        
        do {
            // TODO: Move this to a constant somewhere
            let url = URL(string: "http://demo1042273.mockable.io/mylocations")
            let data = try Data(contentsOf: url!)
            let jsonData = try JSONDecoder().decode(ResponseData.self, from: data)
            
            return (jsonData.locations, nil)
            
        } catch {
            print("Error: TODO")
            return (nil, error)
        }
    }
    
}
