//
//  User.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/27/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: NameWrapper
    let email: String
    let location: LocationWrapper
    let phone: String
    let dob: DOBWrapper
    
    static func getUsers(from userData: Data) throws -> [User] {
        do {
            let decoder = JSONDecoder()
            let users = try
                decoder.decode([User].self, from: userData)
            return users
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct NameWrapper: Codable {
    let first: String
    let last: String
}

struct LocationWrapper: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

struct DOBWrapper: Codable {
    let date: String
}
