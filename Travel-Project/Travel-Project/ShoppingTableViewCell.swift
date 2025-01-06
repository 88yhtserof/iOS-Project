//
//  ShoppingTableViewCell.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/5/25.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    @IBOutlet var backgroundColorView: UIView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bookmarkButton: UIButton!
    
    static let identifier = "shopping-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureSubviews()
    }

    private func configureSubviews() {
        backgroundColorView.backgroundColor = .systemGray6
        backgroundColorView.cornerRadius(5)
        
        checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        checkButton.tintColor = .black
        
        titleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        titleLabel.textColor = .black
        
        bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        bookmarkButton.tintColor = .black
    }
    
    func configure(with shopping: Shopping) {
        titleLabel.text = shopping.title
        let checkImage = shopping.check ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
        checkButton.setImage(checkImage, for: .normal)
        let bookmarkImage = shopping.bookmark ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        bookmarkButton.setImage(bookmarkImage, for: .normal)
    }
}
