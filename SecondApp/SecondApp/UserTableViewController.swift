//
//  UserTableViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/3/25.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    let name = ["고래밥", "칙촉", "카스타드"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        name.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "user-cell-identifier", for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "user-cell-identifier", for: indexPath) as! UserTableViewCell
        cell.profileImageView.backgroundColor = .brown
        cell.nameLabel.text = name[indexPath.row]
        cell.messageLabel.text = "상태 메세지"
        cell.nameLabel.font = .boldSystemFont(ofSize: 16)
        cell.messageLabel.font = .boldSystemFont(ofSize: 13)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
