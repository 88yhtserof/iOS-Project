//
//  ViewController.swift
//  Game369
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

// game369 클래스 만들기
// game 클래스를 먼저 만들고 그 아래 369 클래스 만들기

class ViewController: UIViewController {
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var baseStackView: UIStackView!
    
    private let numbers: [Int] = Array(1...120)
    private lazy var selectedNumber: Int = numbers.count
    private var countClap: Int = 0 {
        didSet {
            resultLabel.isHidden = false
            resultLabel.text = String(format: "숫자 %d까지 총 박수는 %d번 입니다.", selectedNumber, countClap)
        }
    }
    
    private lazy var pickerView: UIPickerView = {
        let view = UIPickerView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        inputTextField.inputView = pickerView
        inputTextField.tintColor = .clear
        
        resultTextView.isUserInteractionEnabled = false
        configureTextView(row: 0)

        view.keyboardLayoutGuide.topAnchor.constraint(equalTo: baseStackView.bottomAnchor).isActive = true
    }
    
    private func configureTextView(row: Int) {
        let max = numbers.count - row
        resultTextView.text = (1...max)
            .map{ String($0) }
            .map{
                var str = $0
                str = str.replacingOccurrences(of: "3", with: "👏")
                str = str.replacingOccurrences(of: "6", with: "👏")
                str = str.replacingOccurrences(of: "9", with: "👏")
                countClap += str.filter{ $0 == "👏" }.count
                return str
            }
            .joined(separator: " ")
    }
    
    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

extension ViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let index = (numbers.count - 1) - row
        return String(numbers[index])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countClap = 0
        selectedNumber = numbers.count - row
        configureTextView(row: row)
    }
}
