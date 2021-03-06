<img src=https://github.com/Soptkathon-26th-bangmoon/BangMoon-Server/blob/master/README_RES/logo.png>

### 구석 문화생활, 방문 / 관람자가 언더 공연에 펀딩하고 공연 영상을 소비할 수 있는 서비스

**[API docs- git wiki](https://github.com/Soptkathon-26th-bangmoon/BangMoon-Server/wiki)**

## Why?

코로나 사태로 인해 다수의 집단이 모이는 극장, 연극, 공연 등 발길이 줄어듦. 이에 따라 공연자들이 수입에 직격타를 맞음. 언더에서 활동하는 사람들은 더 힘들다는 것에 초점을 맞춰봄.

→ 이런사람들의 수익활동을 위해 돈을 내고 관련 영상 동영상을 받아서 볼 수 있는 service를 제공하자!! (무단 배포를 막기 위해 Funding이라는 system 추가?)

## service

-   공연자가 직접 등록(공연 이름/가격/펀딩 목표 등 정보 및 예고)
-   소비자가 관심있는 공연은 응원하기
-   100% 달성 시 결제 요청 보내기(Alert)
-   일괄적으로 자동 결제
-   공연 촬영 후 업로드. 밀어준 사람들에게 공개.

개발 환경
------------
1. Swift 버전
> * 5
2. Xcode 버전
> * 11.5
3. 사용한 라이브러리
> * Alamofire 4.8.2
> * Kingfisher
> * SnapKit

사용한 Extension
------------
> * UIColor : 각종 색 주입, hex로 조절
> * UIImageView : Kingfisher 사용
> * UIView : superview에 맞는 autolayout , rounding, border
> * UIViewcontroller : alertcontroller 

## iOS 뷰
<img src=https://github.com/Soptkathon-26th-bangmoon/BangMoon-Server/blob/master/README_RES/view1.png >
<img src=https://github.com/Soptkathon-26th-bangmoon/BangMoon-Server/blob/master/README_RES/view2.png >
<img src=https://github.com/Soptkathon-26th-bangmoon/BangMoon-Server/blob/master/README_RES/view3.png >



## 핵심가치

1.  **Raising** : 
    언더 공연자를 수면 위로 떠오르게 하다. / 다양한 공연을 공평하게 사람들에게 노출시킴으로써 일으키다.
    
2.  **Low-cost** : 
    기존 티켓 대비 낮은 비용 / 생소한 공연도 적은 비용으로 쉽게 시도해볼 수 있는 기회를 제공.
    
3.  **Seatless** : 
    앉아 있을 청중석이 없는 / 기존의 뮤지컬, 연극 공연과 달리 편안하게 방 안에서 소비하는. 청중석이 필요 없고 언제 어디서나 우린 이동하면서 연극을 볼 수 있다.
    

## 차별점

1.  크라우드 펀딩 : 
    상품이 동영상이다. 언택트의 개념 적용.
    
2.  다른 티켓 플랫폼 : 
    공연자가 다른 소셜커머스와 달리 수수료를 크게 지불하지 않고, 소비자도 낮은 가격으로 즐길 수 있음. 양 측의 진입장벽을 낮춤.
    

## 컬러 선택

1.  BM Purple: 
    메인 컬러. '방문'이 미지한 공간임을 의미. (생소하고 다양한 공연) 으로 개성을 뽐내는 인디 아티스트
2.  BM Gray: 
    서브 컬러. 심플함. 세련됨과 효율성을 상징

## HTTP 서버 통신 구조체 생성
```swift
struct Complete: Codable {
    let status: String
    let message: String
    let data: [ProjectList]
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
```
## HTTP 서버 통신 구현
```swift
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

```

**Contributor**

- [김민희](https://github.com/xwoud)

- [송황호](https://github.com/Hwangho)

- [오준현](https://github.com/5anniversary) 
