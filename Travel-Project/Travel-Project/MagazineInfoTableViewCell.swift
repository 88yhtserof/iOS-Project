//
//  MagazineInfoTableViewCell.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/3/25.
//

import UIKit

class MagazineInfoTableViewCell: UITableViewCell {
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "magazine-info-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureSubviews()
        
    }
    
    private func configureSubviews() {
        travelImageView.backgroundColor = .lightGray
        travelImageView.cornerRadius()
        travelImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = .systemFont(ofSize: 23, weight: .heavy)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .black
        
        subtitleLabel.font = .systemFont(ofSize: 18, weight: .regular)
        subtitleLabel.textColor = .gray
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
}
