//
//  UpDownGame.swift
//  Game369
//
//  Created by 임윤휘 on 1/10/25.
//

import Foundation

// 클래스와 구조체 중 무엇이 적합할지 생각해보기
class UpDownGame: NumberGame {
    var max: Int
    lazy var numbers: [Int] = Array(1...max)
    lazy var randomNumber: Int = numbers.randomElement()!
    private var gameResult: UpDownGameResult = .inital
    var count: Int = 0
    var title: String {
        gameResult.title
    }
    
    enum UpDownGameResult {
        case inital, up, down, win
        
        var title: String {
            switch self {
            case .inital:
                return "UpDown"
            case .up:
                return "Up"
            case .down:
                return "Down"
            case .win:
                return "Win"
            }
        }
    }
    
    init(max: Int) {
        self.max = max
    }
    
    func play(_ number: Int) -> String {
        count += 1
        let selectedIndex = selectedIndex(of: number)
        
        switch randomNumber {
        case number:
            gameResult = .win
            numbers = [numbers[selectedIndex]]
        case ..<number:
            gameResult = .down
            numbers = Array(numbers[..<selectedIndex])
        case ...max:
            gameResult = .up
            numbers = Array(numbers[(selectedIndex + 1)..<numbers.endIndex])
        default:
            print("Unknown Range")
            gameResult = .inital
        }
        return title
    }
    
    private func selectedIndex(of number: Int) -> Int {
        numbers.firstIndex(of: number)!
    }
}
