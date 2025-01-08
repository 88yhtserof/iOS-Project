//: [Previous](@previous)

import Foundation

var nickname = "Hello, playground"

var subnickname = nickname

nickname = "고래밥"
// 구조체는 값타입으로 값이 복사되어 전달된다. 따라서 nicknamedhk subnickname은 서로 다른 인스턴스이다

class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
var jack = User(name: "mentor")
var bran = jack
jack.name = "jack"

// 클래스는 참조타입이기 때문에 인스턴스의 힙 메모리 주소를 전달한다. 따라서 jack과 bran은 서로 같은 인스턴스를 가리킨다

/*
 클래스와 구조체의 상수 변수
 나) 참조 타입의 인스턴스를 받는 변수/상수 는 해당 인스턴스의 힙 메모리 주소를 가진다. 따라서 해당 변수/상수에 새로운 인스턴스 메모리 주소를 할당할 일이 없다면 상수, 있다면 변수로 선언해야한다. 주소 끝에 있는 인스턴스의 내부 프로퍼티를 수정하는 것과는 관계가 없다
 값 타입의 인스턴스를 받는 변수/상수 는 해당 인스턴스를 갖는다. 따라서 인스턴스의 내부 프로퍼티를 수정하는 것과 관계가 있다. 값 타입의 변수/상수를 건들이는 것은 즉 인스턴스를 건들이는 것과 같다.
 */

//: [Next](@next)
