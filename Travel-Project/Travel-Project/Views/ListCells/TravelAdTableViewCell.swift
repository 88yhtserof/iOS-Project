//
//  TravelAdTableViewCell.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/5/25.
//

import UIKit

class TravelAdTableViewCell: UITableViewCell {
    @IBOutlet var backgroundColorView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var adBackgoundView: UIView!
    
    static let identifier = "travel-ad-cell"
    private static let background_colors = [ UIColor.systemPink, UIColor.systemMint, UIColor.systemYellow ].map{ $0.withAlphaComponent(0.3) }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        backgroundColorView.cornerRadius()
        
        titleLabel.font = .systemFont(ofSize: 13, weight: .heavy)
        titleLabel.textColor = .black
        
        adBackgoundView.cornerRadius(5)
    }
    
    func configure(with travel: Travel) {
        titleLabel.text = travel.title
        backgroundColorView.backgroundColor = TravelAdTableViewCell.background_colors.randomElement()
    }

}
