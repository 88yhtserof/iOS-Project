//
//  UIView+Extension.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/3/25.
//

import UIKit

extension UIView {
    func cornerRadius(_ radius: CGFloat = 15) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        
    }
}
