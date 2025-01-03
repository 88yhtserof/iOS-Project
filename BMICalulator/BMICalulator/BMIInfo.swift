//
//  Untitled.swift
//  BMICalulator
//
//  Created by 임윤휘 on 12/31/24.
//

import Foundation

struct BMIInfo: Identifiable, Codable {
    var id = UUID()
    var nickname: String
    var height: Double
    var weight: Double
    
    var bmi: String {
        get {
            String(format: "%.2f", weight / (height * height))
        }
    }
    
    init(nickname: String, cm height: Double, kg weight: Double) {
        self.nickname = !nickname.isEmpty ? nickname : id.uuidString.prefix(4).uppercased()
        self.height = height / 100
        self.weight = weight
    }
}
