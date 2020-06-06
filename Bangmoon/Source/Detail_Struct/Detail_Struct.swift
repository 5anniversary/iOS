//
//  Detail_Struct.swift
//  Bangmoon
//
//  Created by 송황호 on 2020/06/07.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let pPosterImg, pGenre, pName, pFundingMoney: String
    let pGoglaMoney, pTotalMoney, pRemainDate, pSponsors: String
    let pFundingDES, pGepInformation, pStory, pGroupImg: String

    enum CodingKeys: String, CodingKey {
        case pPosterImg = "p_poster_img"
        case pGenre = "p_genre"
        case pName = "p_name"
        case pFundingMoney = "p_funding_money"
        case pGoglaMoney = "p_gogla_money"
        case pTotalMoney = "p_total_money"
        case pRemainDate = "p_remain_date"
        case pSponsors = "p_sponsors"
        case pFundingDES = "p_funding_des"
        case pGepInformation = "p_gep_information"
        case pStory = "p_story"
        case pGroupImg = "p_group_img"
    }
}
