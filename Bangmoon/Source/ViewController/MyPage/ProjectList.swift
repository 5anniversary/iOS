//
//  ProjectList.swift
//  Bangmoon
//
//  Created by 김민희 on 07/06/2020.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation

struct ProjectList: Codable {
    var p_poster_img: URL
    var p_name: String
    var p_genre: String
    var p_date: Int
    var p_total_money: Int
    var p_rate: Int
    var p_times: Int
    var p_percentage: Int
}

struct Project: Codable {
    let status: Int
    let message: String
    let data: [CompleteList]
}

struct CompleteList: Codable {
    let pCompletedImg, pName, pGenre: String
    let pRate, pTimes: Int

    enum CodingKeys: String, CodingKey {
        case pCompletedImg = "p_completed_img"
        case pName = "p_name"
        case pGenre = "p_genre"
        case pRate = "p_rate"
        case pTimes = "p_times"
    }
}
