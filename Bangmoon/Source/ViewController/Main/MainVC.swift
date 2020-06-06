//
//  ViewController.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/06.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var mainTV: UITableView!
    
    let headerView = UIView()
    
    let categoryLabel = UILabel()
    let categoryUnderBar = UIView()
    let musicalLabel = UILabel()
    let theaterLabel = UILabel()
    let classicLabel = UILabel()
    let etcLabel = UILabel()
    var model: MainModel?
    
    
        
    let scrollView = UIScrollView()
    var images = ["mainviewImgMain", "mainviewImgMain2",  "mainviewImgMain3"]

    lazy var rightBarButton : UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "13"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(toSearch))
        return button
    }()
    
    lazy var leftBarButton : UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "12"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(toMyPage))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabelView()
        self.navigationItem.rightBarButtonItem = self.rightBarButton
        self.navigationItem.leftBarButtonItem = self.leftBarButton
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        get()
    }

     
    func setTabelView(){
        mainTV.delegate = self
        mainTV.dataSource = self
        
        let nibHead = UINib(nibName: "MainTVHV", bundle: nil)
        self.mainTV.register(nibHead, forHeaderFooterViewReuseIdentifier: "MainTVHV")
        mainTV.register(UINib(nibName: "MainTVC", bundle: nil), forCellReuseIdentifier: "MainTVC")
        
    }

    @objc func toSearch() {
        
    }
    
    @objc func toMyPage() {
        let sb = UIStoryboard(name: "MyPage", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MyPageVC") as! MyPageVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension MainVC: UITableViewDelegate{ }
extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 316.5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        147
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTVC",
                                                 for: indexPath) as! MainTVC
        
        cell.mainIMG.setImageBangMoon((model?.data[indexPath.row].pPosterImg ?? "") as String)
        cell.titleLabel.text = model?.data[indexPath.row].pName
        cell.categoryLabel.text = model?.data[indexPath.row].pGenre
        cell.dateLabel.text = String(describing: model?.data[indexPath.row].pDate) + "일 남음"
        let money = String(describing: model?.data[indexPath.row].pTotalMoney)
        let rate = String(describing: model?.data[indexPath.row].pPercentage)
        cell.ageLabel.text = model?.data[indexPath.row].pRate
        
        print(rate)
        cell.timeLabel.text = ((String(describing: model?.data[indexPath.row].pTimes)) as String)
        cell.rateLabel.text = money + " " + rate + " %"
        var progress: Float = Float(model?.data[indexPath.row].pPercentage ?? 0)
        
        if progress >= 100 {
            progress = 1
        } else {
            progress = (progress)/100
        }
        
        cell.progress.progress = progress
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.headerView.addSubview(scrollView)
        self.headerView.addSubview(categoryLabel)
        self.headerView.addSubview(etcLabel)
        self.headerView.addSubview(classicLabel)
        self.headerView.addSubview(theaterLabel)
        self.headerView.addSubview(musicalLabel)
        self.headerView.addSubview(categoryUnderBar)

        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView)
            make.leading.equalTo(headerView)
            make.trailing.equalTo(headerView)
            make.bottom.equalTo(headerView).offset(-64.5)
        }
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let nameLabel = UILabel()
            imageView.image = UIImage(named: images[i])
            
            imageView.contentMode = .scaleToFill //  사진의 비율을 맞춤.
            let xPosition = self.view.frame.width * CGFloat(i) // 현재 보이는 스크린에서 하나의 이미지만 보이게 하기 위해
        
            nameLabel.textColor = .white
            nameLabel.textAlignment = .center
            
            imageView.frame = CGRect(x: xPosition,
                                     y: 0,
                                     width: self.view.frame.width,
                                     height: self.view.frame.height)

            scrollView.contentSize.width = self.view.frame.width * CGFloat(1+i)

            scrollView.addSubview(imageView)
            scrollView.addSubview(nameLabel)
        }
        
        categoryLabel.text = "전체"
        categoryLabel.font = Font.catgoryLabel
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = UIColor.purpleColor
      
        musicalLabel.text = "뮤지컬"
        musicalLabel.font = Font.catgoryLabel
        musicalLabel.textAlignment = .center
       
        theaterLabel.text = "연극"
        theaterLabel.font = Font.catgoryLabel
        theaterLabel.textAlignment = .center

        classicLabel.text = "클래식"
        classicLabel.font = Font.catgoryLabel
        classicLabel.textAlignment = .center

        etcLabel.text = "기타"
        etcLabel.font = Font.catgoryLabel
        etcLabel.textAlignment = .center

        categoryUnderBar.backgroundColor = UIColor.purpleColor
        
        categoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.bottom).offset(26)
            make.width.equalTo(self.view.frame.width/5)
            make.leading.equalTo(headerView)
        }
        
        musicalLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.bottom).offset(26)
            make.width.equalTo(self.view.frame.width/5)
            make.leading.equalTo(headerView).offset(self.view.frame.width/5)
        }

        theaterLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.bottom).offset(26)
            make.width.equalTo(self.view.frame.width/5)
            make.leading.equalTo(headerView).offset(self.view.frame.width / 5 * 2)
        }

        classicLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.bottom).offset(26)
            make.width.equalTo(self.view.frame.width/5)
            make.leading.equalTo(headerView).offset(self.view.frame.width / 5 * 3)
        }

        etcLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.bottom).offset(26)
            make.width.equalTo(self.view.frame.width/5)
            make.leading.equalTo(headerView).offset(self.view.frame.width / 5 * 4)
        }
        
        categoryUnderBar.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.bottom).offset(61)
            make.height.equalTo(4)
            make.width.equalTo(self.view.frame.width/5)
            make.leading.equalTo(headerView)
        }


    
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.dequeueReusableCell(withIdentifier: "MainTVC", for: indexPath) as! MainTVC
        
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension MainVC {
    func get(){
        MainService.shared.getMainService(){
            [weak self]
            data in
            
            guard let `self` = self else { return }
            
            switch data {
                
            // 매개변수에 어떤 값을 가져올 것인지
            case .success(let res):
                let response = res as! MainModel
                self.model = response
                
                self.mainTV.reloadData()
                
            case .requestErr(let message):
                self.simpleAlert(title: "리스트 조회 실패", message: "\(message)")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                self.simpleAlert(title: "리스트 조회 실패", message: "네트워크 상태를 확인해주세요.")
            }
            
        }
    }
}
