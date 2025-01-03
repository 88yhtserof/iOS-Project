//
//  ClassStruct.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/2/25.
//

import Foundation

// 1. 가지고 있는 모든 프로퍼티에 초기값 설정(초기화)
// 2. 가지고 있는 프로퍼티를 옵셔널로 선언
// ?. init 함수 사용해 모든 프로퍼티 초기화하기
class Monster {
    let clothes: String
    let speed: Int
    let power: Int
    let experience: Int

    init(clothes: String, speed: Int, power: Int, experience: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experience = experience
    }
}

// 왜 클래스는 멤버 와이즈 이니셜라이즈 구문을 제공하지 않을까?
// 상속은 계속 이어질 수 있다.
// 그러면 Boss와 Super는 Monster부터 자기 자신의 프로퍼티까지 초기화를해야한다. 상속 받은 관계는 서로 영향을 받는다
// 따라서 명시적으로 초기화를 하는 목록을 필수적으로 만드는 것이 아닐까
class BossMoster: Monster {
    
}

class SuperMonster: BossMoster {
    
}

struct MonsterStruct {
    let clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    
    // 구조체는 init 함수를 기본적으로 제공한다 -> 멤버와이즈 이니셜라이즈 구문
}
