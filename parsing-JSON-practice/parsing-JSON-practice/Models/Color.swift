//
//  Color.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/27/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

struct Color: Codable {
    let name: ColorName
    let hex: ColorHex
    var r: Int
    var g: Int
    var b: Int
    
    private mutating func convertRGBValues() {
        self.r /= 255
        self.g /= 255
        self.b /= 255
    }
  
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

struct ColorName: Codable {
    let value: String
}

struct ColorHex: Codable {
    let value: String
}

