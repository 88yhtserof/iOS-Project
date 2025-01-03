//
//  NumberViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 12/30/24.
//

import UIKit

class NumberViewController: UIViewController {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = getToday()
        
        numberTextField.text = UserDefaults.standard.string(forKey: "number")
    
//        print(NSHomeDirectory())
    }
    
    /*
     실시간으로 레이블에 내용 반영
     입력한 내용이 숫자라면 숫자 그대로 출력
     입력한 내용이 문자라면 숫자가 아닙니다 출력
     */

    // Editing Changed
    @IBAction func textEditingChanged(_ sender: UITextField) {
        guard let text = sender.text else {
            print("Failed to get text")
            return
        }
        // resultLabel.text = text.contains(where: { !$0.isNumber }) ? "숫자가 아닙니다" : text
        // OR
         resultLabel.text = Int(text) != nil ? text : "숫자가 아닙니다"
        
        if let intValue = Int(text) {
            resultLabel.text = "\(intValue)"
        } else {
            resultLabel.text = "숫자가 아닙니다"
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // 텍스트필드에 적었던 내용을 영구적으로 저장
        UserDefaults.standard.set(numberTextField.text, forKey: "number")
        
        // 사용자에게 성공적으로 저장되었다는 알림 주기
        // Alert 얼럿(다이얼로그)
        // 1. 타이틀 + 메시지
        let alert = UIAlertController(title: "저장 성공", message: "숫자가 성공적으로 저장되었어요", preferredStyle: .alert)
        // 2. 버튼
        let okButton = UIAlertAction(title: "확인", style: .default)
        let desstructivedButton = UIAlertAction(title: "삭제", style: .destructive)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        let testButton = UIAlertAction(title: "테스트", style: .default)
        let anotherCancelButton = UIAlertAction(title: "취소", style: .cancel)
        // 3. 본문에 버튼 추가
        [ okButton, desstructivedButton, cancelButton, testButton, anotherCancelButton ]
            .forEach{ alert.addAction($0) }
        // 4. 화면에 띄우기
        present(alert, animated: true)
    }
    
    // 반환값이 있는 함수를 통해 기능을 분리하자
    // @discardableResult 어트리뷰트를사용해 반환값이 사용되지 않더라도 경고가 뜨지 않도록 구현할 수 있다.
    // @: Swift Attribute 어트리뷰트
    @discardableResult
    func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        let today = format.string(from: Date())
        return today
    }
    
    // Swift 5.1부터 return 키워드 생략 가능
    // Implicit returns
    // SwiftUI 등장
    // 개인 또는 팀의 코드 스타일에 따라 적용 여부 결정
    func randomnt() -> Int {
        Int.random(in: 1...100)
    }
}
