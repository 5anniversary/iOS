//
//  MyPageVC.swift
//  Bangmoon
//
//  Created by Junhyeon on 2020/06/06.
//  Copyright © 2020 Bangmoon. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class MyPageVC: UITableViewController {

    @IBOutlet weak var myPageTableView: UITableView!
    var ProjectList: [ProjectList] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.ProjectList.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTVC",
                                                 for: indexPath) as! MainTVC
        
        return cell
    }

}
