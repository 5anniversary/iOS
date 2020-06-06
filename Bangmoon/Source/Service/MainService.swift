//
//  MainService.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/07.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import Foundation
import Alamofire

struct MainService {
    private init() {}
    
    static let shared = MainService()
    
    func getMainService(completion: @escaping (NetworkResult<Any>) -> Void) {
        let URL = APIConstants.Main
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData { response in
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(MainModel.self, from: value)
                                
                                completion(.success(result))
                            } catch{
                                completion(.pathErr)
                            }
                        default:
                            break
                        }
                    }
                }
                
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
        
    }
}
