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
    
    let projectButton = UIButton()
    let detailButton = UIButton()
    
        
    let scrollView = UIScrollView()
    var images = ["select_img_iron_man", "select_img_captain_america",  "select_img_spider_man", "select_img_black_panther"]

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
        return 332
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        172
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTVC",
                                                 for: indexPath) as! MainTVC
        let age = "2000"
        
        cell.ageLabel.text = age.insertComma
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.headerView.addSubview(scrollView)
        self.headerView.addSubview(projectButton)
        self.headerView.addSubview(detailButton)

        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView)
            make.leading.equalTo(headerView)
            make.trailing.equalTo(headerView)
            make.bottom.equalTo(headerView).offset(-80)
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

        projectButton.snp.makeConstraints { (make) in
            make.leading.equalTo(headerView).offset(16)
            make.top.equalTo(scrollView.snp.bottom).offset(24)
        }
        detailButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(headerView).offset(-13)
            make.top.equalTo(scrollView.snp.bottom).offset(30)
        }

        projectButton.setImage(UIImage(named: "invalidName"), for: .normal)
        detailButton.setImage(UIImage(named: "43"), for: .normal)
    
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.dequeueReusableCell(withIdentifier: "MainTVC", for: indexPath) as! MainTVC
        
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


