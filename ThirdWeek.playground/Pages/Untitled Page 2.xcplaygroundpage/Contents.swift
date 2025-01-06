//: [Previous](@previous)

import UIKit

var greeting = "Hello, playground"

/*
 선언과 초기화를 따로 할 수 있다
 하지만 초기화(초기값)을 해야 변수를 쓸 수 있다.
 
 클래스 내 모든 프로퍼티(변수)가 초기화가 되어 있어야 한다.(또는 옵셔널 사용)
 또는 initializer 구문을 사용해 인스턴스를 만들 때 초기화해줄 수 있다.
 
 타입은 같지만, 그 타입으로부터 생성된 인스턴스는 모두 다르다.
 
 타입 프로퍼티/메서드
 인스턴스 생성과 상관없이 접근할 수 있는 프로퍼티/메서드
 메타 타입
 따라서 정확히 적으면
 Monster.self.game
 
 타입 멤버는 각 인스턴스에 위치하는 것이 아니라 타입에 위치하기 때문에 메모리 공간을 절약할 수 있다.
 
 타입 멤버는 호출하지 않으면 메모리 공간을 차지하지 않는다. 하지만 한 번 호출하게 되면 그 이후부터 계속 메모리 상에 존재하게 된다.
 인스턴스는 nil이 할당되면 메모리가 해제된다
 */

class Monster {
    static let game = "카트라이더" // 타입 프로퍼티, 저장 프로퍼티, 타입 저장 프로퍼티
    var clothes: String // 인스턴스 프로퍼티, 저장 프로퍼티, 인스턴스 저장 프로퍼티
    let speed: Int
    let exp: Int
    
    init(clothes: String, speed: Int, exp: Int) {
        self.clothes = clothes
        self.speed = speed
        self.exp = exp
    }
    
    func attack() { // 인스턴스 메서드
        
    }
}

let easy = Monster(clothes: "Red", speed: 11, exp: 2) // 인스턴스
easy.clothes // 인스턴스의 프로퍼티를 사용 -> 인스턴스 프로퍼티
easy.attack() // 인스턴스의 메서드를 사용 -> 인스턴스 메서드

var hard: Monster? = Monster(clothes: "Blue", speed: 22, exp: 10)
hard?.clothes
hard?.attack()

hard = nil //  메모리 해제

//: [Next](@next)


/*
 지연 저장 프로퍼티
 예) 넷플리스 홈 화면
 선택도 안 했는데, 겉에 포스터를 위한 모델 생성으로 불필요한 비디오가 다 메모리 공간을 차지하고 있음 -> 메모리 낭비
 지연 저장 프로퍼티로 선언해서 필요할 때만 Video 객체가 생성되도록 만들자.
 
 lazy는 let과 함께 사용할 수 없다. 즉 변수로만 사용할 수 있다.
 나: 지연되어 객체가 생성되더라도, 메모리 공간에는 해당 프로퍼티의 영역이 존재하게 된다. 따라서 지연 저장 프로퍼티의 객체 생성 시 그 이미 마련되어 있는 공간에 그 객체가 할당되는 것이기 때문에 변수로 선언되어야 한다.
 */

class Movie {
    let title: String
    let runtime: Int
    lazy var video = Video() // 선택도
    
    init(title: String, runtime: Int) {
        self.title = title
        self.runtime = runtime
        
        print("Movie init")
    }
    
}

class Video {
    var file = UIImage(named: "star")
    
    init() {
        print("Video init")
    }
}

var media = Movie(title: "오징어", runtime: 123)

media.video // media의 video는 지연 저장 프로퍼티이기 때문에 이때 객체가 생성된다


/*
 프로퍼티
 - 저장 프로퍼티
 - 연산 프로퍼티(메모리 공간을 차지 하지 않음): 저장 프로퍼티를 사용해 연산한다
    - 나: 연산 프로퍼티는 함수와 같다
    - 함수는 타입 영역에 위치해, 코드영역의 함수의 위치를 가리킨다.
 */
class BMI {
    let weight: Double
    let height: Double
    
    var BMIValue: Double {
        get {
            (weight * weight) / height
        }
    }
    
    var status: String {
        get {
            BMIValue < 18.5 ? "저체중" : "정상 이상"
        }
    }
    
    var BMIResult: String {
        get {
            "BMI 지수는 \(BMIValue)로, \(status) 입니다."
        }
    }
    
    init(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
    }
}

let bmi = BMI(weight: 70, height: 1.8)
let result = bmi.BMIResult
