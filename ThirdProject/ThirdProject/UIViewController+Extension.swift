//
//  UIViewController+Extension.swift
//  ThirdProject
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

extension UIViewController {
    // collection view를 사용하지 않은 인스턴스에도 아래 함수에 접근할 수 있다 -> 불필요
    // 특정 프로토콜을 상속받은 vc만 아래 함수를 갖도록 한정하기 뭐였지
    static func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        let width = UIScreen.main.bounds.width
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // 섹션이 하나 있을 때 사용하면 모든 아이템 외부 inset이 조정할 수 있다.
        return layout
    }
}
