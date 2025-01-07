//
//  TenCollectionViewCell.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/7/25.
//

import UIKit

class TenCollectionViewCell: UICollectionViewCell {
    @IBOutlet var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.backgroundColor = .black
    }

}
