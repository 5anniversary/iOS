//
//  APIConstants.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/06.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation

struct APIConstants {

    static let BaseURL = "http://13.124.98.137:3000"

    static let Detail = BaseURL + "/project/"
    static let Main = BaseURL + "/project/list"
    static let MainImage = BaseURL + "/project/deadline"
    static let myPageprojectURL = APIConstants.BaseURL + "/project/list"
    static let myPagecompleteURL = APIConstants.BaseURL + "/user/complete"

}
