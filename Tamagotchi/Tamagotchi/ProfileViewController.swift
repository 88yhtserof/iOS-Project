//
//  ProfileViewController.swift
//  Tamagotchi
//
//  Created by 임윤휘 on 1/1/25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - View
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var nutrientLabel: UILabel!
    @IBOutlet var waterLabel: UILabel!
    @IBOutlet var feedingTextField: UITextField!
    @IBOutlet var wateringTextField: UITextField!
    @IBOutlet var growingGuideLabel: UILabel!
    
    //MARK: - Properties
    var tamagotchiInfo: TamagotchiInfo!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureData()
    }
    
    //MARK: - Action
    @IBAction func feedingButtonDidTapped(_ sender: UIButton) {
        let nutrient = getRawInputNumber(feedingTextField)
        growingGuideLabel.isHidden = nutrient < 100
        guard growingGuideLabel.isHidden else { return }
        tamagotchiInfo.nutrient += nutrient
        configureTamagotchi()
    }
    
    @IBAction func wateringButtonDidTapped(_ sender: UIButton) {
        let water = getRawInputNumber(wateringTextField)
        growingGuideLabel.isHidden = water < 50
        guard growingGuideLabel.isHidden else { return }
        tamagotchiInfo.water += water
        configureTamagotchi()
    }
    
    @IBAction func EditingTextFieldDidBegin(_ sender: UITextField) {
        scrollViewBottomConstraint.constant = -150
        let contentOffset = CGPoint(x: 0, y: 150)
        scrollView.setContentOffset(contentOffset, animated: true)
        
    }
    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        dismissKeyboard()
    }
    
    @IBAction func textFieldReturnKeyDidTapped(_ sender: UITextField) {
        dismissKeyboard()
    }
    
    //MARK: - Method
    func dismissKeyboard() {
        // TextField 활성화 시 키보드 높이 만큼 화면을 올리기 위해 ScrollView를 화면에 적용했음
        // ScrollView를 화면에 적용하면서 AutoLayout을 설정하는게 많이 까다로웠고, 특히 13mini 화면에서 설정 오류가 나 대응이 어려웠음
        scrollViewBottomConstraint.constant = 0
        let contentOffset = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(contentOffset, animated: true)
        view.endEditing(true)
    }
    
    func getRawInputNumber(_ textfield: UITextField) -> Int {
        guard let text = textfield.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !text.isEmpty else { return 1 }
        guard let number = Int(text) else { return 0 }
        return number
    }
}

//MARK: - Configure
private extension ProfileViewController {
    func configureTextField() {
        [ feedingTextField, wateringTextField ]
            .forEach {
                $0?.keyboardType = .numberPad
            }
    }
    
    func configureData() {
        if let data = UserDefaults.standard.data(forKey: "TamagotchiInfo") {
            guard let info = try? PropertyListDecoder().decode(TamagotchiInfo.self, from: data) else {
                fatalError("Failed to decode data")
            }
            tamagotchiInfo = info
        } else {
            tamagotchiInfo = TamagotchiInfo(nickname: "대장", level: 1, nutrient: 0, water: 0)
            tamagotchiInfo.updateTamagotchiInfo()
        }
        
        navigationItem.title = "\(tamagotchiInfo.nickname)의 다마고치"
        configureTamagotchi()
    }
    
    func configureTamagotchi() {
        messageLabel.text = Massage.makeRandomMessage(tamagotchiInfo.nickname)
        imageView.image = UIImage(named: tamagotchiInfo.imageName)
        levelLabel.text = String(tamagotchiInfo.calculateLevel())
        nutrientLabel.text = "\(tamagotchiInfo.nutrient)개"
        waterLabel.text = "\(tamagotchiInfo.water)개"
    }
}
