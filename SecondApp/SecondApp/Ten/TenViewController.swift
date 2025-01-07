//
//  TenViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/7/25.
//

import UIKit

/*
 UITableViewController에서 있는 table view 관련 메서드를 우리가 직접 작업을 해주어야 함
 -> 프로토콜, 델리게이트
 
 할 일이 많은 뷰를 위해 일을 위임받아 대리 수행할 필요가 있다
 -> Delegate
 1. 테이블뷰 이름
 2. 테이블뷰 부하 직원(프로토콜 채택)
 3. 필수 기능(필수 구현 메서드)
 4. 테이블뷰와 부하직원이 서로 연결(= 타입으로서의 프로토콜, Protocol as Type)
 */
class TenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "no-profile-tableview-cell")
        
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "no-profile-tableview-cell") as? NoProfileTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "222"
        return cell
    }
}
