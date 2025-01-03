//
//  MySavedContentsViewController.swift
//  MovieProject
//
//  Created by 임윤휘 on 12/27/24.
//

import UIKit

class MySavedContentsViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var exploringButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSubviews()
    }
    
    func configureSubviews() {
        titleLabel.font = .systemFont(ofSize: 23, weight: .bold)
        titleLabel.numberOfLines = 1
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .light)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.lineBreakMode = .byWordWrapping
        
        settingButton.setTitleColor(.white, for: .normal)
        settingButton.backgroundColor = .systemBlue
        exploringButton.setTitleColor(.black, for: .normal)
        exploringButton.backgroundColor = .white
        
        [ settingButton, exploringButton ]
            .forEach{
                $0?.layer.cornerRadius = 6
                $0?.clipsToBounds = true
            }
    }
}
