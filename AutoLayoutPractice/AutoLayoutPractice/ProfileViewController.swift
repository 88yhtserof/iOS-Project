//
//  ProfileViewController.swift
//  AutoLayoutPractice
//
//  Created by 임윤휘 on 1/1/25.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.layer.cornerRadius = 25
        profileImageView.clipsToBounds = true
    }
}
