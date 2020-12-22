//
//  ResponseData.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import Foundation

struct ResponseData: Decodable {
    var locations: [ApiLocation]
    var status: String
}
