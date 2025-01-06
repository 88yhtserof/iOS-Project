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
    
    func configure(with city: City) {
        if let url = URL(string: city.city_image) {
            cityImageView.kf.setImage(with: url)
        }
        
        firstCityLabel.text = city.first_city_name
        cityListLabel.text = city.city_explain
    }
}
