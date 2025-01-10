//
//  ListCellConfigurable.swift
//  Game369
//
//  Created by 임윤휘 on 1/9/25.
//

import Foundation

protocol ListCellConfigurable: AnyObject {
    associatedtype CellType
    
    func configure(with:  CellType)
}
