//
//  CityInfoCircleCollectionViewCell.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/7/25.
//

import UIKit
import Kingfisher

class CityInfoCircleCollectionViewCell: UICollectionViewCell {
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    static let identifier = "CityInfoCircleCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        configureSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        travelImageView.image = UIImage(systemName: "photo")
    }
    
    private func configureSubviews() {
        travelImageView.backgroundColor = .systemGray6
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.cornerRadius(30)
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        
        subtitleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
    }
    
    func configure(with city: City, ranges: [NSRange]?) {
        if let url = URL(string: city.city_image) {
            travelImageView.kf.setImage(with: url)
        }
        if let ranges {
            let texts = [ city.first_city_name, city.city_explain ]
            let labels: [UILabel] = [ titleLabel, subtitleLabel ]
            (0..<texts.count)
                .forEach{ i in
                    let (range, label, text) = (ranges[i], labels[i], texts[i])
                    let attributedString = NSMutableAttributedString(string: text)
                    attributedString.addAttribute(.foregroundColor, value: UIColor.orange, range: range)
                    label.attributedText = attributedString
                }
        } else {
            titleLabel.text = city.first_city_name
            subtitleLabel.text = city.city_explain
        }
    }

}
