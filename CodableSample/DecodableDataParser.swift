//
//  DecodableDataParser.swift
//  CodableSample
//
//  Created by other on 2017/11/07.
//  Copyright © 2017 TakahiroTsuchiya. All rights reserved.
//

import Foundation
import APIKit

class DecodableDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }
    func parse(data: Data) throws -> Any {
        return data
    }
}
