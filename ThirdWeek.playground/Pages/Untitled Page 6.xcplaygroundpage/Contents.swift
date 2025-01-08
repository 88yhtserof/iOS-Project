//: [Previous](@previous)

import UIKit

// 프로토콜
/*
 Method Requirements 메서드 요구사항, 프로토콜 요구사항
 규격있는 형태로 만들자, 프로토콜을 준수(confirm)한다, 프로토콜 지향형 프로그래밍
 프로토콜은 구조체 클래스 열거형 등 큰 타입들을 서포트한다
 클래스에서만 사용하는 프로토콜은 AnyObject를 달아 제약을 주자
 최적화, 프로토콜이 신경 쓸 타입들을 줄이면서 성능을 최적화할 수 있다.
 
 옵셔널 요구사항, 옵셔널 프로토콜, 꼭 구현하지 않아도 되는 것들(Obtional Requirements)
 */
@objc
protocol ViewPresentableProtocol: AnyObject {
    // 저장, 연산 모두 가능 그래서 프로퍼티는 항상 var로 선언해야한다
    // get set 여부만 지정 <- 최소 요구사항
    var backgroundColor: UIColor { get } // get은 필수, set은 선택
    var navigationTitleString: String { get set } // get set 필수
    
    func configureNavigationBar()
    func configure(with:String)
    @objc optional func configureView()
}

// 프로토콜 명세를 따르는 타입 == 프로토콜을 준수(confirm)한다
class SearchViewController: ViewPresentableProtocol {
    var name = "World"
    var backgroundColor: UIColor {
        .black
    }
    var navigationTitleString: String {
        get {
            ""
        }
        set {
            name = newValue
        }
    }
    
    func configureNavigationBar() {
        <#code#>
    }
    
    func configure(with: String) {
        <#code#>
    }
}

class SettingVierwController: ViewPresentableProtocol {
    var backgroundColor: UIColor = .yellow
    var navigationTitleString: String = ""
    
    func configureNavigationBar() {
        <#code#>
    }
    
    func configure(with: String) {
        <#code#>
    }
}

//struct User: ViewPresentableProtocol {
//    var backgroundColor: UIColor = .red
//    var navigationTitleString: String
//    
//    func configureNavigationBar() {
//        <#code#>
//    }
//    
//    func configure(with: String) {
//        <#code#>
//    }
//}


/*
 tableView.delegate = self
 -> Protocol Type 프로토콜은 타입이다
 
 */
protocol Mentor { }

class Jack: Mentor { }

class Hue: Mentor { }

struct Bran: Mentor { }

struct Den: Mentor { }

var mentor: Mentor = Jack()

mentor = Bran()

mentor = Hue()

//: [Next](@next)
