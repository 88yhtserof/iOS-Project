//
//  RandomPosterViewController.swift
//  FirstApp
//
//  Created by 임윤휘 on 12/26/24.
//

import UIKit

class RandomPosterViewController: UIViewController {
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    let bigNumber = Int.random(in: 1...5) // RandomPosterViewController의 범위에 속하는 변수
    
    // 사용자가 눈에 화면이 뜨기 직전에 실행된는 기능
    // 스토리보드 상에서 구현하기 어려운 디자인(모서리 둥글기 등)
    // 보는 중에 모서리가 변경되면 이상하니깐
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterImageView.image = UIImage(named: "아바타")
        posterImageView.backgroundColor = UIColor(named: "pointColor")
        posterImageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        randomButton.setTitle("랜덤 버튼", for: .normal)
        randomButton.setTitle("즉시 선택", for: .highlighted)
        randomButton.setTitleColor(.white, for: .normal)
        randomButton.setTitleColor(.red, for: .highlighted)
        randomButton.backgroundColor = .systemIndigo
        randomButton.layer.cornerRadius = 10
        randomButton.layer.borderWidth = 2
        randomButton.layer.borderColor = UIColor.yellow.cgColor
        
        resultLabel.text = "안녕"
        resultLabel.textColor = .brown
        resultLabel.font = .systemFont(ofSize: 30, weight: .black)
        resultLabel.textAlignment = .center
        resultLabel.backgroundColor = .white
        resultLabel.layer.cornerRadius = 15
        resultLabel.layer.borderWidth = 2
        resultLabel.layer.borderColor = UIColor.brown.cgColor
        resultLabel.clipsToBounds = true
    }
    
    // Button이 TouchUpInside가 될 떄 실행
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        print(#function)
        let randomNumber = Int.random(in: 1...5) // randomButtonTapped의 범위에 속하는 변수
        posterImageView.image = UIImage(named: "\(randomNumber)")
    }
}
