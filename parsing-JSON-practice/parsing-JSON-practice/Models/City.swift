//
//  City.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/28/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct City: Codable {
    let name: String
    let main: CityTempWrapper
    let weather: [CityWeatherWrapper]

    static func getCities(from cityData: Data) throws -> [City] {
        do {
            let decoder = JSONDecoder()
            let cities = try
                decoder.decode([City].self, from: cityData)
            return cities
        } catch {
            throw JSONError.decodingError(error)
        }
    }

}



struct CityTempWrapper: Codable {
    let temp: Double
}

struct CityWeatherWrapper: Codable {
    let description: String
}
