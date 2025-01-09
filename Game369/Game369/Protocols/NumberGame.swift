//
//  NumberGame.swift
//  Game369
//
//  Created by 임윤휘 on 1/10/25.
//

import Foundation

protocol NumberGame {
    var max: Int { get }
    var numbers: [Int] { get }
    
    func play(_ number: Int) -> String
}
