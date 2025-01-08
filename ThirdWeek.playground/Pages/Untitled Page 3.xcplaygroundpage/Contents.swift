//: [Previous](@previous)

import Foundation

class Mobile { // base class
    var name: String
    var nickname: String {
        willSet {
            print("willset", newValue, nickname)
        }
        didSet {
            print("didset", oldValue, nickname)
        }
    }
    
    // 연산 프로퍼티
    // 나) 함수와 동일하게 연산 프로퍼티는 데이터 영역에 존재하는 타입에 메모리 공간이 위치해있고, 그 안에는 코드 영역에 존재하는 함수의 위치 주소가 담겨있다.
//    var introduce: String { // get 생략
//        return "당신은 \(name)제품을 구매했고 구매 날짜는 \(Date())입니다."
//    }
    var introduce: String {
        get {
            return "당신은 \(name)제품을 구매했고 구매 날짜는 \(Date())입니다."
        }
        set {
            name = newValue
            nickname = newValue
        }
    }
    
//    // 타입 연산 프로퍼티
//    // 내부의 타입 저장 프로퍼티만 사용할 수 있다
//    
//    // 인스턴스 연산 프로퍼티 내부에 타입 저장 프로퍼티 사용해도 될까
//    // 타입 프로퍼티는 "타입"에 공간이 존재하기 때문에 타입을 통해 불러올 수 있다
//    static let s = "Hello"
//    var introduce2: String { // get 생략
//        return "당신은 \(Mobile.s)제품을 구매했고 구매 날짜는 \(Date())입니다."
//    }
    
    init(name: String) {
        self.name = name
        self.nickname = name
    }
    
    static func test() { // 타입 메서드
        
    }
    
    func buy() {
        print("구매했습니다")
    }
}

class Google: Mobile {
    // 오버라이드 재정의
    override func buy() {
        super.buy()
        print("안드로이드를 구매했습니다.")
    }
    
    // 타입 메서드의 오버라이드 class
    
}

class Apple: Mobile {
    let wwdc = "WWDC"
}

let phone: Mobile = Mobile(name: "Phone")
phone.name
phone.introduce = "왕"


let google = Google(name: "Google") // 부모의 멤버까지도 초기화되어 있어야 한다
let apple = Apple(name: "APPLE")
/*
 나: 구조체는 init 구문이 필수가 아니고 자동으로 ㅁ만들어 지기까지 하는데, 이유는 클래스의 경우 상속 특성을 가지고 있어~
 */

// 타입 확인 연산자 is
// 상속받은 타입은 타입 확인 시 함께~
phone is Mobile
google is Mobile
apple is Mobile

phone is Google
phone is Apple

apple is Google

// 타입 어노테이션으로 타입을 부모클래스로 설정
// 그러면 Mobile 타입을 상속받은 누구라도 iPhone 변수에 할당할 수 있다
var iPhone: Mobile = Apple(name: "iPhone")
iPhone = Google(name: "Google")
iPhone.name // Mobile 타입을 상속한 누구든 할당될 수 있기 때문에 Mobile 멤버만 사용할 수 있다

// as? 옵셔널 반환 타입: 실패 시 nil 반환
// as! -> 실패 시 런타임 오류
// as 업 캐스팅은 언제나 성공, 상속받은 부모 클래스의 타입이 되는 것이기 때문
if let iPhone = iPhone as? Apple {
    iPhone.wwdc //  타입이 다운캐스팅되어 Apple의 멤버에까지 접근할 수 있다.
} else {
    
}

// Any va AnyObject
var something: [Any] = []
something.append(true)
something.append(1)
something.append("Hello")
something.append([1,2,3])
something.append(Apple(name: "Apple")) // 4

print(something[1])

if let element = something[0] as? Bool {
    print(element)
}

if let element = something[4] as? Google {
    print(element.name)
}

// 타입 캐스팅은 런타임에, 따라서 Any 타입은 컴파일 시 알 수 없다.
/*
 AnyObject는 클래스와 같이 참조타입만 담을 수 있다.
 bool, string, 등 구조체는 담을 수 없다
 이를 통해 참조타입만 해당 프로토콜을 사용한다는 것을 명시하면 성능면애서 좋다
 */



// 오버라이드 재정의
/*
 오버라이드
 */
google.buy()





enum PhoneType {
    case apple, google
}

func returnMobile(type: PhoneType) -> Mobile {
    var p: Mobile

    switch type {
    case .apple:
        p = Apple(name: "Apple")
    case .google:
        p = Google(name: "Google")
    }
    
    return p
}

let a = returnMobile(type: .apple)
let b = returnMobile(type: .google)
if let a = a as? Apple {
    print(a.wwdc)
}

if let a = a as? Google {
    print("!!")
} else {
    print("!")
}


