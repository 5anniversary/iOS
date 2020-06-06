//
//  MainTVC.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/07.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import UIKit

class MainTVC: UITableViewCell {

    @IBOutlet weak var mainIMG: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainIMG.contentMode = .scaleAspectFill
        titleLabel.font = Font.titleLabel
        categoryLabel.font = Font.detailLabel
        ageLabel.font = Font.detailLabel
        timeLabel.font = Font.detailLabel
        dateLabel.font = Font.detailLabel
        rateLabel.font = Font.detailLabel
        progress.progressTintColor = UIColor.purpleColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
