//
//  UpDownGameViewController.swift
//  Game369
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

class UpDownGameViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var gameImageView: UIImageView!
    @IBOutlet var maxTextField: UITextField!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var outerStackView: UIStackView!
    @IBOutlet var gameImageViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        configureKeyboardConstraints()
    }
    
    private func configureSubviews() {
        titleLabel.text = "UpDown"
        subtitleLabel.text = "GAME"
        
        gameImageView.image = configureRandomGameImage()
        
        maxTextField.placeholder = "최대 숫자를 입력하세요"
        maxTextField.font = .systemFont(ofSize: 16, weight: .bold)
        maxTextField.textAlignment = .center
        maxTextField.keyboardType = .numberPad
        
        var config = startButton.configuration
        config?.baseBackgroundColor = .black
        config?.baseForegroundColor = .white
        config?.title = "시작하기"
        startButton.configuration = config
    }
    
    private func configureRandomGameImage() -> UIImage? {
        let imageNumber = (1...5).randomElement()!
        let imageName = String(format: "emotion%d", imageNumber)
        return UIImage(named: imageName)
    }
    
    private func configureKeyboardConstraints() {
        view.keyboardLayoutGuide.topAnchor.constraint(greaterThanOrEqualTo: outerStackView.bottomAnchor, constant: 10).isActive = true
    }
    
    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func startButtonDidTapped(_ sender: UIButton) {
        guard let maxNumber = Int(maxTextField.text ?? "") else { return }
        view.endEditing(true)
        
        let id = UpDownGamePlayViewController.identifier
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        guard let upDownGamePlayVC = storyboardMain.instantiateViewController(withIdentifier: id) as? UpDownGamePlayViewController else { return }
        upDownGamePlayVC.maxNumber = maxNumber
        let navigationController = UINavigationController(rootViewController: upDownGamePlayVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
        
    }
}
