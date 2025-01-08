//
//  TenCollectionViewCell.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/7/25.
//

import UIKit

class TenCollectionViewCell: UICollectionViewCell {
    @IBOutlet var posterImageView: UIImageView!
    
    lazy var label = UILabel()
    static let format: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        return format
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.backgroundColor = .black
        
            
//        if !(posterImageView.isHidden) {
//            
//        }
        
        
//        format.dateFormat = "yy년 MM월 dd일"
//        let result = format.string(from: Date())
//        label.text = result
        /*
         -> cell 객체 생성만큼 DateFormatter 객체가 생성된다.
         나: 동일한 객체인 경우 모든 인스턴스에 존재할 필요가 없다. 특히 DateFormatter는 여러 기능을 가지고 있기 때문에 인스턴스 생성 비용이 크다
         */
    }

}
