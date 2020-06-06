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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTV.delegate = self
        mainTV.dataSource = self
        
        let nibHead = UINib(nibName: "MainTVHV", bundle: nil)
        self.mainTV.register(nibHead, forHeaderFooterViewReuseIdentifier: "MainTVHV")
        mainTV.register(UINib(nibName: "MainTVC", bundle: nil), forCellReuseIdentifier: "MainTVC")

    }


}

extension MainVC: UITableViewDelegate{ }
extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTVC",
                                                 for: indexPath) as! MainTVC

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Dequeue with the reuse identifier
        let mainHeaderView =
            tableView.dequeueReusableHeaderFooterView(withIdentifier: "MainTVHV") as? MainTVHV
    
    
        return mainHeaderView
    }
}


