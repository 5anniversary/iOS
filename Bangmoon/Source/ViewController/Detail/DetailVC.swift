//
//  DetailVC.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/06.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import UIKit

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
    
    
    // override
    override func viewDidLoad() {
        super.viewDidLoad()

      
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
