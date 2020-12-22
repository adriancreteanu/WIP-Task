//
//  ApiLocation.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 21.12.2020.
//

import Foundation

struct ApiLocation: Location, Decodable {

    let address: String
    let imageStringURL: String
    let label: String
    let latitude: Double
    let longitude: Double

    init(from decoder: Decoder) throws {
        address = ApiLocation.decode(
            value: String.self,
            withDecoder: decoder,
            forKey: .address,
            fallbackKey: .address,
            defaultValue: ""
        )
        imageStringURL = ApiLocation.decode(
            value: String.self,
            withDecoder: decoder,
            forKey: .image,
            fallbackKey: .image,
            defaultValue: ""
        )
        label = ApiLocation.decode(
            value: String.self,
            withDecoder: decoder,
            forKey: .label,
            fallbackKey: .label,
            defaultValue: ""
        )
        latitude = ApiLocation.decode(
            value: Double.self,
            withDecoder: decoder,
            forKey: .lat,
            fallbackKey: .latitude,
            defaultValue: 0
        )
        longitude = ApiLocation.decode(
            value: Double.self,
            withDecoder: decoder,
            forKey: .lng,
            fallbackKey: .longitude,
            defaultValue: 0
        )
    }

    private static func decode<Value: Decodable>(
        value: Value.Type,
        withDecoder decoder: Decoder,
        forKey codingKey: CodingKeys,
        fallbackKey: AltCodingKeys,
        defaultValue: Value
    ) -> Value {
        let value = decodedValue(value, withDecoder: decoder, forKey: codingKey)
            ?? decodedValue(value, withDecoder: decoder, forKey: fallbackKey)
            ?? defaultValue
        return value
    }

    private static func decodedValue<Value: Decodable, Key: CodingKey>(
        _ value: Value.Type,
        withDecoder decoder: Decoder,
        forKey key: Key
    ) -> Value? {
        guard
            let values = try? decoder.container(keyedBy: type(of: key).self),
            let value = try? values.decode(value, forKey: key)
        else {
            return nil
        }
        return value
    }

}

private extension ApiLocation {

    enum CodingKeys: String, CodingKey {
        case address
        case image
        case label
        case lat
        case lng
    }

    enum AltCodingKeys: String, CodingKey {
        case address
        case image
        case label
        case latitude
        case longitude
    }

}

