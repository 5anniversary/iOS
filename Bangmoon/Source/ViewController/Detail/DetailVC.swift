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
        
        get(index)
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
