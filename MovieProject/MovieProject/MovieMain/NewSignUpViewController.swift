//
//  NewSignUpViewController.swift
//  MovieProject
//
//  Created by 임윤휘 on 12/27/24.
//

import UIKit

/*
 < 회원가입 조건 >
 1. 이메일과 비밀번호 필수
 2. 비밀번호는 6자리 이상
 3. 닉네임은 중복 불가
 4. 위치는 조건 없음
 5. 추천 코드는 숫자만 입력 가능
 
 < 코딩 기록 >
 - Content Type 또는 Secure Text Entry가 password일 경우 최초 선택 이후 Editing Changed를 인식하지 않음
 - 최초의 회원가입 버튼의 .highlited 상태 설정하기
 - InputType과 각 textField 순서 주의하기
 - 이메일 비밀번호 모두 잘 적혀 있으면 o
    추가 정보가 없으면 o  t t
    추가 정보가 오류면 x  t f
    추가 정보가 통과면 o  t t
    즉 하나라도 f이면 가입 불가
*/

class NewSignUpViewController: UIViewController {
    
    //MARK: - View
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signUpGuideLabel: UILabel!
    @IBOutlet var promoCodeTextField: UITextField!
    
    //MARK: - Type
    enum InputType: Int {
        case email, password, nickname, location, promoCode
        
        var description: String? {
            switch self {
            case .password:
                return "비밀번호는 6자리 이상이어야 합니다"
            case .nickname:
                return "이미 존재하는 닉네임 입니다"
            case .promoCode:
                return "추천코드는 숫자만 입력할 수 있습니다"
            default:
                return nil
            }
        }
    }
    
    //MARK: - Properties
    private var isEnabledSignUp: Bool = false {
        didSet {
            configureSignUpButtonHighlited(by: isEnabledSignUp)
        }
    }
    private var inputTextFieldStates = [false, false, true, true, true] {
        didSet {
            isEnabledSignUp = !inputTextFieldStates.contains(false)
        }
    }
    private let existingNicknames = [ "임새싹", "김새싹", "이새싹", "최새싹", "새싹", "도봉" ]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSignUpButtonHighlited(by: isEnabledSignUp)
        promoCodeTextField.keyboardType = .numberPad
    }
    
    //MARK: - Action
    @IBAction func doneButtonDidTapped(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func signUpButtonDidTapped(_ sender: UIButton) {
        signUpGuideLabel.text = isEnabledSignUp ? "" : "이메일과 비밀번호를 입력하세요"
        signUpGuideLabel.isHidden = isEnabledSignUp
    }
    
    @IBAction func textFieldDidChanged(_ sender: UITextField) {
        guard let inputType = InputType(rawValue: sender.tag) else { return }
        var result: Bool = true
        
        switch inputType {
        case .email:
            result = !(emailTextField.text?.isEmpty ?? true)
        case .password:
            guard let text = sender.text else { return }
            result = !(text.count < 6 )
        case .nickname:
            guard let text = sender.text else { return }
            result = !(existingNicknames.contains(text))
        case .promoCode:
            guard let text = sender.text else { return }
            result = !(text.contains(where: { !$0.isNumber }))
        default:
            return
        }
        
        setSignGuideLabel(for: sender, by: inputType, isCorrected: result)
    }
    
    //MARK: - Method
    func configureSignUpButtonHighlited(by isEnabled: Bool) {
        if isEnabled {
            signUpButton.setTitle("회원가입 성공", for: .highlighted)
            signUpButton.setTitleColor(.green, for: .highlighted)
        } else {
            signUpButton.setTitle("회원가입 실패", for: .highlighted)
            signUpButton.setTitleColor(.red, for: .highlighted)
        }
    }
    
    func checkEmailAndPassword() {
        isEnabledSignUp = !((emailTextField.text?.isEmpty ?? true) || (passwordTextField.text?.count ?? 0 < 6))
    }
    
    func setSignGuideLabel(for textField: UITextField, by type: InputType, isCorrected: Bool) {
        if isCorrected {
            inputTextFieldStates[textField.tag] = true
            textField.textColor = .white
            signUpGuideLabel.isHidden = true
        } else {
            inputTextFieldStates[textField.tag] = false
            textField.textColor = .red
            signUpGuideLabel.text = type.description
            signUpGuideLabel.isHidden = false
        }
    }
}
