//
//  JSONError.swift
//  parsing-JSON-practice
//
//  Created by Sunni Tang on 8/27/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}
