//
//  FourthViewController.swift
//  FirstApp
//
//  Created by 임윤휘 on 12/27/24.
//

import UIKit

// gestrue
// number
// action
class FourthViewController: UIViewController {
    
    @IBOutlet var nicknameTextfield: UITextField!
    @IBOutlet var resultsLabel: UILabel!
    
    @IBOutlet var oneTextField: UITextField!
    @IBOutlet var twoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabelDesign()
        oneTextFieldDesign(ph: "닉네임을 작성하시오", nicknameTextfield)
        oneTextFieldDesign(ph: "이메일을 작성하시오", oneTextField)
        oneTextFieldDesign(ph: "비밀번호를 작성하시오", twoTextField, color: .orange)
    }
    
    func resultLabelDesign() {
        resultsLabel.backgroundColor = .lightGray
        resultsLabel.numberOfLines = 0
        resultsLabel.text = #"A string is a series of characters, such as "Swift", that forms a collection. Strings in Swift are Unicode correct and locale insensitive, and are designed to be efficient. The String type bridges with the Objective-C class NSString and offers interoperability with C functions that works with strings."#
    }
    
    /*
     Argument(전달 인자)와 파라미터(매개변수)의 차이
     parameter(매개변수): 함수 내에서 사용되는 상수명 Argument label/parameter name
     Argument(전달 인자): 매개변수의 값을 할당되는 실제 값, 리터럴
     Argument label가 없는 경우의 명칭: wilde card _
     */
    func oneTextFieldDesign(ph placeholderText: String,
                            _ textField: UITextField, color: UIColor = .black) {
        textField.placeholder = placeholderText
        textField.borderStyle = .bezel
        textField.textAlignment = .center
        textField.textColor = color
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    @IBAction func tapGetureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
