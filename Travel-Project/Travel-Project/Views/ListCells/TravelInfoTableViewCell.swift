//
//  TravelInfoTableViewCell.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/5/25.
//

import UIKit
import Kingfisher

class TravelInfoTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var saveCountLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    static let identifier = "travel-info-cell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        travelImageView.image = UIImage(systemName: "photo")
    }
    
    private func configureSubviews() {
        titleLabel.font = .systemFont(ofSize: 13, weight: .heavy)
        titleLabel.textColor = .black
        subtitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        subtitleLabel.textColor = .gray
        subtitleLabel.numberOfLines = 2
        
        [ gradeLabel, saveLabel, saveCountLabel ]
            .forEach{ $0?.font = .systemFont(ofSize: 10, weight: .light) }
        
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.backgroundColor = .gray
        travelImageView.image = UIImage(systemName: "photo")
        travelImageView.tintColor = .yellow
        travelImageView.cornerRadius()
        
        likeButton.tintColor = .white
    }
    
    func configure(with travel: Travel) {
        guard let description = travel.description,
              let grade = travel.grade,
              let save = travel.save_description,
              let travel_image = travel.travel_image,
              let like = travel.like else { return }
        
        titleLabel.text = travel.title
        subtitleLabel.text = description
        gradeLabel.text = String(format: "(%.1f)", grade)
        saveCountLabel.text = save
        
        if let url = URL(string: travel_image) {
            travelImageView.kf.setImage(with: url)
        }
        
        let imageName = like ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
