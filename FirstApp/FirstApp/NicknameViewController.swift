//
//  NicknameViewController.swift
//  FirstApp
//
//  Created by 임윤휘 on 12/26/24.
//

import UIKit

class NicknameViewController: UIViewController {

    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var clickButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var countingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        nicknameTextField.placeholder = "닉네임을 입력하세요. 예) 바다"
        nicknameTextField.borderStyle = .roundedRect
        nicknameTextField.text = "고래밥"
        nicknameTextField.keyboardType = .emailAddress
        
        countingLabel.text = String(nicknameTextField.text?.count ?? 0)
    }
    
    // Did end on exit
    // Enter 키를 통해 키보드 내리기
    @IBAction func textfieldReturnTapped(_ sender: UITextField) {
        print(#function)
    }
    
    // EditingChanged
    @IBAction func textfieldEditingChanged(_ sender: UITextField) {
        print(#function, nicknameTextField.text?.count)
        countingLabel.text = String(nicknameTextField.text?.count ?? 0)
    }
    
    @IBAction func clickButtonDidTapped(_ sender: UIButton) {
        print(#function)
//        resultLabel.text = nicknameTextField.text
        resultLabel.text = "\(nicknameTextField.text!) 입력되었습니다."
        
        view.endEditing(true)
    }
}
