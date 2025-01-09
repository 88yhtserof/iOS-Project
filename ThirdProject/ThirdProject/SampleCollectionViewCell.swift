//
//  SampleCollectionViewCell.swift
//  ThirdProject
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

class SampleCollectionViewCell: UICollectionViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    
    static let identifier: String = "SampleCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // layoutSubviews는 view의 드로잉 사이클과 관련돼 있다
    // layoutIfNeeded
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
    }

}
