//
//  UIView+Extension.swift
//  Game369
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

extension UIView {
    func cornerRadius(_ radius: CGFloat = 15) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
