//
//  TamagotchiInfo.swift
//  Tamagotchi
//
//  Created by 임윤휘 on 1/2/25.
//

import Foundation

// 비즈니스 로직은 모델도 따로 구성해 사용할 수 있지 않을까 고민
struct TamagotchiInfo: Identifiable, Codable {
    var id = UUID()
    var nickname: String
    var level: Int
    var nutrient: Int
    var water: Int
    
    var imageName: String {
        get {
            switch level {
            case 10:
                return "2-9"
            case 1...9:
                return "2-\(level)"
            default:
                return "2-1"
            }
        }
    }
    
    init(nickname: String, level: Int, nutrient: Int, water: Int) {
        self.nickname = nickname
        self.level = level
        self.nutrient = nutrient
        self.water = water
    }
    
    /// Set the tamagotchi info to UserDefaults
    func updateTamagotchiInfo() {
        let data = try? PropertyListEncoder().encode(self)
        UserDefaults.standard.set(data, forKey: "TamagotchiInfo")
    }
    
    /// Calulate annd return level
    mutating func calculateLevel() -> Int {
        let (nutrient, water) = (nutrient, water)
        let result = ((nutrient / 5) + (water / 2)) / 10
        
        if result >= 10 {
            level = 10
        } else {
            level = result
        }
        updateTamagotchiInfo()
        return level
    }
}
