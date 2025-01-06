//
//  UserTableViewCell.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/3/25.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    @IBOutlet var likeButton: UIButton!
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var messageLabel: UILabel!
    
    
    /*
     UIKit의 화면구성 방법
     - 스토리보드
     - 코드

     두 방법에서 호출되는 메서드가 다르다(예: 이니셜라이저)
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        configure()
    }
    
    // cell을 재사용할 때, cell이 재사용되기 전에 호출되어 view의 상태를 초기화하는 코드를 구현할 수 있는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = UIImage(systemName: "star")
        
    }
    
    private func configure() {
        profileImageView.backgroundColor = .brown
        nameLabel.font = .boldSystemFont(ofSize: 16)
        messageLabel.font = .boldSystemFont(ofSize: 13)
        messageLabel.numberOfLines = 0
    }
    
    func configureData(friend: Friends) {
        nameLabel.text = friend.nameDescription
        messageLabel.text = friend.message
        
        
        
        // 데이터 기준 판단
        if let imageStr = friend.profile_image {
            let url = URL(string: imageStr)
            profileImageView.kf.setImage(with: url)
        }
        
        let likeImageName = friend.like ? "star.fill" : "star"
        likeButton.setImage(UIImage(systemName: likeImageName), for: .normal)
    }
}
