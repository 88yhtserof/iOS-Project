//
//  BMICalculatorViewController.swift
//  BMICalulator
//
//  Created by 임윤휘 on 12/30/24.
//

import UIKit

class BMICalculatorViewController: UIViewController {
    
    //MARK: - View
    @IBOutlet var textFieldsOutlineView: [UIView]!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var saveInfoButton: UIButton!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    //MARK: - Properties
    private let _isSaveInfoKey = "isSaveInfo"
    private let _BMIInfoKey = "BMIInfo"
    private var isSaveInfo: Bool!
    private var bmiInfo: BMIInfo?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureData()
        configureSubviews()
    }
    
    //MARK: - Action
    @IBAction func resultButtonDidTapped(_ sender: UIButton) {
        guard let nicknameInput = nicknameTextField.text,
              let heightInput = heightTextField.text,
              let weightInput = weightTextField.text else {
            print("Failed to get input")
            return
        }
        
        guard let height = validateNumberInputValue(heightInput, range: (0.0..<250.0)) else {
            configureAlert(type: .error(.height))
            return
        }
        guard let weight = validateNumberInputValue(weightInput,range: (0.0..<180.0)) else {
            configureAlert(type: .error(.weight))
            return
        }
        let nickname = nicknameInput.trimmingCharacters(in: .whitespacesAndNewlines)
        
        bmiInfo = BMIInfo(nickname: nickname, cm: height, kg: weight)
        
        UserDefaults.standard.set(isSaveInfo, forKey: _isSaveInfoKey)
        if isSaveInfo {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(bmiInfo), forKey: "BMIInfo")
        } else {
            UserDefaults.standard.removeObject(forKey: _BMIInfoKey)
        }
        
        configureAlert(type: .success)
    }
    
    @IBAction func resetButtonDidTapped(_ sender: UIButton) {
        textFields.forEach{ $0.text = nil }
    }
    
    @IBAction func randomBMIButtonDidTapped(_ sender: UIButton) {
        heightTextField.text = randomNumber(range: (0..<250))
        weightTextField.text = randomNumber(range: (0..<180))
    }
    
    @IBAction func saveButtonDidTapped(_ sender: UIButton) {
        isSaveInfo.toggle()
        configureSaveButtonState()
    }
    
    //MARK: - Method
    func validateNumberInputValue(_ value: String, range: Range<Double>) -> Double? {
        let text = value.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty,
              let num = Double(text),
              range.contains(num) else { return nil }
        return num
    }
    
    func randomNumber(range: Range<Int>) -> String {
        String(range.randomElement()!)
    }
}

//MARK: - Configure
private extension BMICalculatorViewController {
    func configureData() {
        isSaveInfo = UserDefaults.standard.bool(forKey: _isSaveInfoKey)
        if let data = UserDefaults.standard.data(forKey: _BMIInfoKey) {
            bmiInfo = try? PropertyListDecoder().decode(BMIInfo.self, from: data)
        }
    }
    
    func configureSubviews() {
        textFieldsOutlineView
            .forEach {
                $0.layer.cornerRadius = 20
                $0.layer.borderColor = UIColor.black.cgColor
                $0.layer.borderWidth = 1
            }
        textFields
            .forEach {
                $0.borderStyle = .none
            }
        
        configureSaveButtonState()
        
        if let bmiInfo {
            nicknameTextField.text = bmiInfo.nickname
            heightTextField.text = String(bmiInfo.height)
            weightTextField.text = String(bmiInfo.weight)
        }
    }
    
    func configureSaveButtonState() {
        let imageName = isSaveInfo ? "checkmark.circle" : "circle"
        let image = UIImage(systemName: imageName)
        saveInfoButton.setImage(image, for: .normal)
        // isSeleceted를 사용해 check 마크 표시
        // image에 색상을 적용하기 위해 설정한 tintColor가 selected 상태일 때에 title의 배경으로 설정되어 예상한 UI가 나오지 않음
    }
    
    /*
     똑같이 반복되는 Alert 구성을 함수로 만들어 반복되는 코드 줄이기
     열거형을 사용해서 Alert의 타입을 구분하고,
     더불어 연관값으로 error의 종류를 세분화해서 사용자에게 어떤 부분이 잘못되었는지 구분해서 설명할 수 있다
    */
    
    enum ErrorKind: String {
        case height = "키"
        case weight = "몸무게"
        
        var text: String {
            self.rawValue
        }
    }
    
    enum AlertType {
        case error(ErrorKind), success
    }
    
    func configureAlert(type: AlertType) {
        var title: String
        var message: String
        
        switch type {
        case .success:
            title = "나의 BMI 지수"
            message = "\(bmiInfo!.nickname)님의 BMI 지수는 \(bmiInfo!.bmi) 입니다."
        case .error(let errorKind):
            title = "입력 오류"
            message = "\(errorKind.text) 입력창을 확인하세요."
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
