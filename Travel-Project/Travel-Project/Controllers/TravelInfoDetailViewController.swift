//
//  TravelInfoDetailViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/7/25.
//

import UIKit
import Kingfisher

class TravelInfoDetailViewController: UIViewController {
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var moreButton: UIButton!
    
    var travelInfo: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        travelImageView.cornerRadius()
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.backgroundColor = .systemGray6
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        titleLabel.textAlignment = .center
        subtitleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        
        var configuration = moreButton.configuration
        configuration?.title = "다른 관광지 보러 가기"
        configuration?.baseBackgroundColor = .systemBlue
        moreButton.configuration = configuration
        
        if let travelInfo {
            titleLabel.text = travelInfo.title
            subtitleLabel.text = travelInfo.description
            guard let url = URL(string: travelInfo.travel_image ?? "") else { return }
            travelImageView.kf.setImage(with: url)
        }
    }
    
    @IBAction func moreButtonDidTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
