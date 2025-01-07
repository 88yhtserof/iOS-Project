//
//  CityInfoTableViewCell.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/6/25.
//

import UIKit
import Kingfisher

class CityInfoTableViewCell: UITableViewCell {
    @IBOutlet var roundBackgroundView: UIView!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var firstCityLabel: UILabel!
    @IBOutlet var cityListBackgroundView: UIView!
    @IBOutlet var cityListLabel: UILabel!
    
    // 파일명 받아오기
    static let identifier = "city-info-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityImageView.image = UIImage(systemName: "photo")
    }
    
    
    private func configureSubviews() {
        roundBackgroundView.cornerRadius()
        
        firstCityLabel.textColor = .white
        firstCityLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.image = UIImage(systemName: "photo")
        cityImageView.backgroundColor = .systemGray6
        
        cityListBackgroundView.backgroundColor = .black.withAlphaComponent(0.3)
        
        cityListLabel.textColor = .white
        cityListLabel.font = .systemFont(ofSize: 13, weight: .light)
    }
    
    func configure(with city: City, ranges: [NSRange]?) {
        if let url = URL(string: city.city_image) {
            cityImageView.kf.setImage(with: url)
        }
        
        if let ranges {
            let texts = [ city.first_city_name, city.city_explain ]
            let labels: [UILabel] = [ firstCityLabel, cityListLabel ]
            (0..<texts.count)
                .forEach{ i in
                    let (range, label, text) = (ranges[i], labels[i], texts[i])
                    let attributedString = NSMutableAttributedString(string: text)
                    attributedString.addAttribute(.foregroundColor, value: UIColor.orange, range: range)
                    label.attributedText = attributedString
                }
        } else {
            firstCityLabel.text = city.first_city_name
            cityListLabel.text = city.city_explain
        }
    }
}
