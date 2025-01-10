//
//  CircleCollectionViewCell.swift
//  Game369
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell, ListCellConfigurable {
    @IBOutlet var circleView: UIView!
    @IBOutlet var titleLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            circleView.backgroundColor = isSelected ? .black : .white
            titleLabel.textColor = isSelected ? .white : .black
        }
    }
    
    static let identifier = String(describing: CircleCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureSubviews()
    }

    private func configureSubviews() {
        let width = circleView.frame.width
        circleView.cornerRadius(width / 2)
    }
    
    func configure(with number: Int) {
        titleLabel.text = String(number)
    }
}
