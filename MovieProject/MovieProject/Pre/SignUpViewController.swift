//
//  SignUpViewController.swift
//  MovieProject
//
//  Created by 임윤휘 on 12/26/24.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var emailAddressTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var promoCodeTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var moreInfoSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailAddressTextField.placeholder = "example.netflix.com"
        emailAddressTextField.keyboardType = .emailAddress
        emailAddressTextField.textAlignment = .center
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textAlignment = .center
        
        nicknameTextField.font = .italicSystemFont(ofSize: 13)
        
        locationTextField.placeholder = "Seoul, Korea"
        
        promoCodeTextField.textColor = .red
        promoCodeTextField.borderStyle = .bezel
        promoCodeTextField.backgroundColor = .white
        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.setImage(UIImage(), for: .normal)
        signUpButton.setTitle("환영합니다", for: .highlighted)
        signUpButton.setTitleColor(.red, for: .highlighted)
        signUpButton.setImage(UIImage(systemName: "heart.fill"), for: .highlighted)
        
        moreInfoSwitch.setOn(false, animated: true)
        moreInfoSwitch.onTintColor = .red
        moreInfoSwitch.thumbTintColor = .white
        moreInfoSwitch.backgroundColor = .clear
        moreInfoSwitch.layer.borderColor = UIColor.lightGray.cgColor
        moreInfoSwitch.layer.borderWidth = 1
        
    }
    @IBAction func signUpButtonDidTouchUpInside(_ sender: UIButton) {
        view.endEditing(true)
    }
}
