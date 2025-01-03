//
//  UserTableViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/3/25.
//

import UIKit
import Kingfisher

struct Friend {
    let name: String
    let message: String
    let profile_image: String
}

class UserTableViewController: UITableViewController {
    
    let friends = FriendsInfo().list
    
    let name = ["고래밥", "칙촉", "카스타드"]
    let message = ["고래밥 냠냠", "행복한 하루", "배고파"]
    let profile = [ "star", "pencil", "star.fill" ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "user-cell-identifier", for: indexPath) as! UserTableViewCell
        cell.profileImageView.backgroundColor = .brown
        
        let friend = friends[indexPath.row]
        
        // 데이터 기준 판단
        if let imageStr = friend.profile_image {
            let url = URL(string: imageStr)
            cell.profileImageView.kf.setImage(with: url)
        } else {
            cell.profileImageView.image = UIImage(systemName: "star")
        }
        
        let likeImageName = friend.like ? "star.fill" : "star"
        cell.likeButton.setImage(UIImage(systemName: likeImageName), for: .normal)
        
        cell.nameLabel.text = friend.name
        cell.messageLabel.text = friend.message
        
        cell.nameLabel.font = .boldSystemFont(ofSize: 16)
        cell.messageLabel.font = .boldSystemFont(ofSize: 13)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
