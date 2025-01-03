//
//  ProfileEditViewController.swift
//  Tamagotchi
//
//  Created by 임윤휘 on 1/1/25.
//

import UIKit

class ProfileEditViewController: UIViewController {
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var nicknameEditTextField: UITextField!
    @IBOutlet var editGuideLabel: UILabel!
    
    private var newNickname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonDidTapped(_ sender: UIBarButtonItem) {
        // unwind 메서드를 연결할 경우, 호출x
        guard let decodedData = UserDefaults.standard.data(forKey: "TamagotchiInfo"),
              var info = try? PropertyListDecoder().decode(TamagotchiInfo.self, from: decodedData),
              let nickname = newNickname else {
            print("Failed to save nickname")
            return
        }
        
        info.nickname = nickname
        let encodedData = try? PropertyListEncoder().encode(info)
        UserDefaults.standard.set(encodedData, forKey: "TamagotchiInfo")
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nicknameEditTextFieldButtonEditingChanged(_ sender: UITextField) {
        guard var text = sender.text else { return }
        text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        editGuideLabel.isHidden = ((2...6) ~= text.count)
        saveButton.isEnabled = ((2...6) ~= text.count)
        newNickname = text
    }
    
    @IBAction func nicknameEditTextFieldEndButtonDidTapped(_ sender: UITextField) {
        view.endEditing(true)
    }
}
