//
//  MainModel.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/07.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation

struct MainModel: Codable {
    let status: Int
    let message: String
    let data: [MainData]
}

// MARK: - Datum
struct MainData: Codable {
    let pIdx: Int
    let pPosterImg: String
    let pName, pGenre: String
    let pDate, pTotalMoney: Int
    let pRate, pTimes: String
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
        case pPercentage = "p_percentage"
    }
}
