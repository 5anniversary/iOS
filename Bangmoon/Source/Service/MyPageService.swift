import Foundation
import Alamofire

struct MyPageService {
    static let shared = MyPageService()
    func getMyPageProjectService(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.myPageprojectURL
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
                
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(Complete.self, from: value)
                                
                                completion(.success(result))
                            } catch {
                                completion(.pathErr)
                            }
                        default:break
                        }
                    }
                }
            case .failure:completion(.networkFail)
            }
        }
    }
    
    func getMyPageCompleteService(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.myPagecompleteURL
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
                
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(Complete.self, from: value)
                                
                                completion(.success(result))
                            } catch {
                                completion(.pathErr)
                            }
                        default:break
                        }
                    }
                }
            case .failure:completion(.networkFail)
            }
        }
    }
}
