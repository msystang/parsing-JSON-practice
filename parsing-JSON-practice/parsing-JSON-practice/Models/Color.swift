//
//  Color.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/27/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct Color: Codable {
    let name: ColorNameWrapper
    let hex: ColorHexWrapper
    var rgb: ColorRGBWrapper
    let a: Int = 1
  
    static func getColors(from colorData: Data) throws -> [Color] {
        do {
            let decoder = JSONDecoder()
            let colors = try
                decoder.decode([Color].self, from: colorData)
            return colors
        } catch {
            throw JSONError.decodingError(error)
        }
    }

}

struct ColorNameWrapper: Codable {
    let value: String
}

struct ColorHexWrapper: Codable {
    let value: String
}

struct ColorRGBWrapper: Codable {
    var r: Double
    var g: Double
    var b: Double
    
    mutating func convertValue() {
        self.r /= 255
        self.g /= 255
        self.b /= 255
    }
}
