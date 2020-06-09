//
//  MainImageModel.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/07.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation

// MARK: - MainImage
struct MainImage: Codable {
    let status: Int
    let message: String
    let data: [MainImageData]
}

// MARK: - Datum
struct MainImageData: Codable {
    let pPosterImg: String

    enum CodingKeys: String, CodingKey {
        case pPosterImg = "p_poster_img"
    }
}
