import UIKit
import Alamofire
import Kingfisher

class MyPageVC: UITableViewController {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var myPageTableView: UITableView!
    var ProjectList: [ProjectList] = []
    var CompleteList: [CompleteList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
//        myPageTableView.dataSource = self
//        myPageTableView.delegate = self
        
//        myPageTableView.register(UINib(nibName: "WorkingCell", bundle: nil),
//                                 forCellReuseIdentifier: "WorkingCell")
//
        self.tableView.register(WorkingCell.self, forCellReuseIdentifier: "WorkingCell")
        self.tableView.register(EndCell.self, forCellReuseIdentifier: "EndCell")

//        myPageTableView.register(UINib(nibName: "EndCell", bundle: nil),
//                                 forCellReuseIdentifier: "EndCell")

        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "asset73X8")
        navigationItem.titleView = UIImageView(image: image)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.CompleteList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let workingCell = tableView.dequeueReusableCell(withIdentifier: WorkingCell.identifier,for: indexPath) as? WorkingCell else { return UITableViewCell() }
//            workingCell.mainImageView.setImageBangMoon(ProjectList[indexPath.row].pPosterImg )
            

            return workingCell
        } else {
            guard let endCell = tableView.dequeueReusableCell(withIdentifier: EndCell.identifier,
                                                              for: indexPath) as? EndCell
                else { return UITableViewCell() }

            
            return endCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 171
        }
        else {
            return 297
        }
    }
    

}


extension MyPageVC {
    
    func get(){
        MyPageService.shared.getMyPageProjectService(){
            [weak self]
            data in
            
            guard let `self` = self else { return }
            
            switch data {
                
            // 매개변수에 어떤 값을 가져올 것인지
            case .success(let res):
                let response = res as! Project
                self.ProjectList = response.data
                
                print(self.ProjectList)
                
                
                self.myPageTableView.reloadData()
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
