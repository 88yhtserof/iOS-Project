//: [Previous](@previous)

import UIKit

var greeting = "Hello, playground"

//: [Next](@next)

class JeckUserDefaults {
    var age: Int {
        get {
            UserDefaults.standard.integer(forKey: "age")
        } set {
            UserDefaults.standard.set(newValue, forKey: "age")
        }
    }
    
    var nickname: String {
        get {
            UserDefaults.standard.string(forKey: "nickname") ?? "대장"
        } set {
            UserDefaults.standard.set(newValue, forKey: "nickname")
        }
    }
}

class vc: UIViewController {
    
    let jack = JeckUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jack.nickname = "dddd"
    }
}
