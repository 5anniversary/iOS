//
//  DetailVC.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/06.
//  Copyright © 2020 Bangmoon. All rights reserved.
//
//  DetailVC.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/06.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import UIKit

@IBDesignable
class DetailVC: UIViewController {
    
    
    @IBOutlet weak var pPosterImg: UIImageView! // 포스터 이미지
    @IBOutlet weak var pGenrelbl: UILabel!         // 유형
    @IBOutlet weak var pNamelbl: UILabel!          // 제목
    @IBOutlet weak var pTotalMoneylbl: UILabel!    // 총 모인 금액
    @IBOutlet weak var pFundingMoneylbl: UILabel!  // 금액
    @IBOutlet weak var pRemainDatelbl: UILabel!    // 남은 시간
    @IBOutlet weak var pSponsorslbl: UILabel!      // 후원자
    @IBOutlet weak var pFundingDEStx: UITextView!  // 펀딩 설명
    @IBOutlet weak var pGepInformationtx: UITextView! // 프로젝트 소개
    @IBOutlet weak var pStorytx: UITextView!        // 줄거리
    @IBOutlet weak var pGroupImg: UIImageView!      // 등장인물
    
    
    @IBOutlet weak var sponbtn: UIButton!       // 후원하기 버튼
    
    var index = 0
    // override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pGenrelbl.text = "연극"
        pGenrelbl.textColor = .white
        pNamelbl.text = "쉬어 매드니스"
        pTotalMoneylbl.text = "1,280,000"
        pRemainDatelbl.text = "10일"
        pSponsorslbl.text = "256명"
        pSponsorslbl.sizeToFit()
        pFundingMoneylbl.text = "5,000 원"
        
        pFundingDEStx.text = "목표 금액인 1,000,000원이 모여야만 결제됩니다. 결제는 2020년 6월 30일에 다함께 진행됩니다."
        pGepInformationtx.text = "사건이 벌어진 바로 그날, 그 날의 관객과 함께 살인사건을 해결하는 코믹 추리 수사극! Shear Madness 미용실, 그리고 살인사건 언제나 말 많고 분주한 ‘쉬어매드니스 미용실;의 일상이 뒤집히는 날! 미용실 위층에서 일어난 살인사건의 용의자를 반드시 찾아야한다."
        pStorytx.text = """
        사건이 피해자는 미용실 위층에 살고 있던 한 사람
        왕년에 잘 나가던 유명 피아니스트 ‘바이엘 하’이다.

        손님으로 가장해 잠복하고 있던 형사들은 미용실에 함께 있던
        사람들을 용의자로 지목하고,  이 광경을 모두 지켜보고 있던
        관객들은 목격자이자 배심원이 되어 용의자의 행적을 캐묻는다.

        저마다 완벽하고 치밀한 알리바이를 내세워 자신을 변호하는
        네 명의 인물들. 미용실 주인 ‘조호진(조지)’와 ‘장미숙(수지)’
        미용실 단골손님인 부잣집 사모님 ‘한보현’
        골동품 판매상인 ‘오준수’까지!

        범인은 바로여기! 미용실 안에 있다!
        오늘의 당신만이 오늘의 범인을 잡을 수 있다!
        당신이 지목할 범인은 누구인가?
        """
        
        
        let image = UIImage(named: "asset73X8")
        navigationItem.titleView = UIImageView(image: image)
    }
    
    
    
    
    
    // 밀어주기 버튼 눌렀을때 alert
    @IBAction func Sopnbtnclick(_ sender: Any) {
        
        let alert = UIAlertController(title: "밀어주기", message: "후원 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        
        let yes = UIAlertAction(title: "네", style: .default, handler: nil)
        
        let no = UIAlertAction(title: "아니요", style: .default, handler: nil)
        
        alert.addAction(yes)
        alert.addAction(no)
        
        present(alert, animated: false, completion: nil)
        
        
    }
    
    
}


extension UIView{
    @IBInspectable
    var conerradious: CGFloat{
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

extension DetailVC {
    func get(_ index: Int){
        DetailService.shared.getDetailService(index){
            [weak self]
            data in
            
            guard let `self` = self else { return }
            
            switch data {
                
            // 매개변수에 어떤 값을 가져올 것인지
            case .success(let res):
                let response = res as! Detail
<<<<<<< Updated upstream
                self.pGenrelbl.text = response.data[0].pGenre
=======
                self.pPosterImg.setImageBangMoon(response.data[0].pPosterImg)
                self.pGenrelbl.text = response.data[0].pGenre
                self.pNamelbl.text = response.data[0].pName
                self.pTotalMoneylbl.text = response.data[0].pFundingMoney
                self.pFundingMoneylbl.text = response.data[0].pTotalMoney
                self.pRemainDatelbl.text = response.data[0].pDate
                self.pSponsorslbl.text = response.data[0].pSponsors
                self.pFundingDEStx.text = response.data[0].pFundingDES
                self.pGepInformationtx.text = response.data[0].pInformation
                self.pStorytx.text = response.data[0].pStory
             self.pGroupImg.setImageBangMoon(response.data[0].pGroupImg)
                
                
>>>>>>> Stashed changes
                
            case .requestErr(let message):
                self.simpleAlert(title: "공지사항 조회 실패", message: "\(message)")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                self.simpleAlert(title: "카테고리 조회 실패", message: "네트워크 상태를 확인해주세요.")
            }
            
        }
    }
}
<<<<<<< Updated upstream
=======


>>>>>>> Stashed changes
