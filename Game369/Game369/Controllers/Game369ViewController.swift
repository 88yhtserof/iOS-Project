//
//  Game369ViewController.swift
//  Game369
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

class Game369ViewController: UIViewController {
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var baseStackView: UIStackView!
    
    private var game369 = Game369(max: 120)
    private lazy var selectedNumber: Int = game369.max
    private var result: String = "" {
        didSet {
            resultTextView.text = result
            resultLabel.text = String(format: "숫자 %d까지 총 박수는 %d번 입니다.", selectedNumber, game369.clapCount)
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
        let max = game369.max - row
        result = game369.play(max)
    }
    
    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

//MARK: - PickView Delegate, DataSource
extension Game369ViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return game369.max
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let index = (game369.max - 1) - row
        return String(game369.numbers[index])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedNumber = game369.max - row
        configureTextView(row: row)
    }
}
