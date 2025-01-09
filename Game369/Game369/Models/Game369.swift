//
//  Game369.swift
//  Game369
//
//  Created by 임윤휘 on 1/9/25.
//

import Foundation

// 클래스와 구조체 중 무엇이 적합할지 생각해보기
class Game369: NumberGame {
    let max: Int
    lazy var numbers: [Int] = Array(1...max)
    var clapCount: Int = 0
    
    init(max: Int) {
        self.max = max
    }
    
    func play(_ number: Int) -> String {
        clapCount = 0
        return (1...number)
            .map{ String($0) }
            .map{
                var str = $0
                str = str.replacingOccurrences(of: "3", with: "👏")
                str = str.replacingOccurrences(of: "6", with: "👏")
                str = str.replacingOccurrences(of: "9", with: "👏")
                clapCount += str.filter{ $0 == "👏" }.count
                return str
            }
            .joined(separator: " ")
    }
}
