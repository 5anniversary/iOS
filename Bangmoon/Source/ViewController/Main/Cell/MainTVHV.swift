//
//  MainTVHV.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/07.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import UIKit

class MainTVHV: UITableViewHeaderFooterView {

    @IBOutlet weak var mainCV: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainCV.delegate = self
        mainCV.dataSource = self
        mainCV.register(UINib(nibName: "MainCVC", bundle: nil), forCellWithReuseIdentifier: "MainCVC")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension MainTVHV: UICollectionViewDelegate { }
extension MainTVHV: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCVC",
                                                      for: indexPath) as! MainCVC
        
        if indexPath.row > 1 {
            cell.backgroundColor = .yellow
        }
        
        return cell
    }
    
    
}
