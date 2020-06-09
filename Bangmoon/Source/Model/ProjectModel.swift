//
//  ProjectModel.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/07.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation

struct Project: Codable {
    let status: Int
    let message: String
    let data: [ProjectList]
}

struct CompleteList: Codable {
    let pCompletedImg: String
    let pName, pGenre: String
    let pRate, pTimes: Int

    enum CodingKeys: String, CodingKey {
        case pCompletedImg = "p_completed_img"
        case pName = "p_name"
        case pGenre = "p_genre"
        case pRate = "p_rate"
        case pTimes = "p_times"
    }
}


struct Complete: Codable {
    let status: String
    let message: String
    let data: [CompleteList]
}


struct ProjectList: Codable {
    let pIdx: Int
    let pPosterImg,pName, pGenre: String
    let pDate, pTotalMoney, pRate, pTimes: Int
    let pPercentage: Int

    enum CodingKeys: String, CodingKey {
        case pIdx = "p_idx"
        case pPosterImg = "p_poster_img"
        case pName = "p_name"
        case pGenre = "p_genre"
        case pDate = "p_date"
        case pTotalMoney = "p_total_money"
        case pRate = "p_rate"
        case pTimes = "p_times"
        case pPercentage = "p_percentage "
    }
}
