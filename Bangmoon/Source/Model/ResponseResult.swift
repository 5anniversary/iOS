//
//  Model.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/06.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation

struct ResponseResult<T: Codable>: Codable {
    var success: Bool
    var message: String?
    var data: [T]?
}

struct ResponseSimpleResult<T: Codable>: Codable {
    var success: Bool
    var message: String
    var data: T?
}

struct ResponseTempResult: Codable {
    var success: Bool
    var message: String
}
