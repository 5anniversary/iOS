//
//  Struct_detail.swift
//  Bangmoon
//
//  Created by 송황호 on 2020/06/07.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation

    struct Struct_detail: Codable {
        let status: Int
        let message: String
        let data: [Datum]
    

    // MARK: - Datum
    struct Datum: Codable {
        let pPosterImg: String
        let pGenre, pName: String
        let pFundingMoney, pTotalMoney, pDate, pSponsors: Int
        let pFundingDES, pInformation, pStory: String
        let pGroupImg: String

        enum CodingKeys: String, CodingKey {
            case pPosterImg = "p_poster_img"
            case pGenre = "p_genre"
            case pName = "p_name"
            case pFundingMoney = "p_funding_money"
            case pTotalMoney = "p_total_money"
            case pDate = "p_date"
            case pSponsors = "p_sponsors"
            case pFundingDES = "p_funding_des"
            case pInformation = "p_information"
            case pStory = "p_story"
            case pGroupImg = "p_group_img"
        }
    }
}
