//
//  ApiLocation.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 21.12.2020.
//

import Foundation

struct ApiLocation: Location, Decodable  {
    var address: String
    var imageStringURL: String?
    var label: String
    var latitude: Double
    var longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case address
        case label
        case latitude = "lat"
        case longitude = "lng"
        case imageStringURL = "image"
    }
    
    enum AltCodingKeys: String, CodingKey {
        case address
        case label
        case latitude = "latitude"
        case longitude = "longitude"
        case imageStringURL = "image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        address = try values.decode(String.self, forKey: .address)
        imageStringURL = try values.decodeIfPresent(String.self, forKey: .imageStringURL)
        label = try values.decode(String.self, forKey: .label)
        
        do {
            latitude = try values.decode(Double.self, forKey: CodingKeys.latitude)
            longitude = try values.decode(Double.self, forKey: CodingKeys.longitude)
        } catch {
            let altValues = try decoder.container(keyedBy: AltCodingKeys.self)
            latitude = try altValues.decode(Double.self, forKey: .latitude)
            longitude = try altValues.decode(Double.self, forKey: .longitude)
        }
    }
}

struct ResponseData: Decodable {
    var locations: [ApiLocation]
    var status: String
}
