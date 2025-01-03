//
//  ViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 12/30/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var recommendButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        posterImageView.image = UIImage(named: "a")
        if let url = URL(string: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTSiTLV4G58sJnkEObdxRf6TgRDq0Zd42qQXc73rND_nTa93suDjxjEv_141XMKPcimuJGALyY") {
            posterImageView.kf.setImage(with: url)
        } else {
            posterImageView.image = UIImage(named: "star")
        }
        
        print(resultLabel.isEnabled, resultLabel.isUserInteractionEnabled)
        resultLabel.isEnabled = true
        resultLabel.isUserInteractionEnabled = true
    }

    // Did End On Exit
    // UITextField.text와 UILavel.tex 모두 String? 타입
    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        let text = sender.text!
            .trimmingCharacters(in: .whitespacesAndNewlines)
        // text 프로퍼티가 nil일 경우 내부적으로 empty하게 빈 문자열을 반환한다.
        
        // 빈칸 확인
        // 공백 제거 Whitspace
        // 대소문자 구분x
        if text.count == 0 {
            resultLabel.text = "검색어를 작성해주세요"
        } else if text.uppercased() == "TMI" {
            resultLabel.text = "너무 과한 정보"
        } else {
            resultLabel.text = "\(text)를 입력했습니다"
        }
    }
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        print(#function)
    }
    
    func aboutOptional() {
        // 옵셔널 스트링 타입
        var nickname: String? = "고래밥"
        var age: Int? = 22
        nickname = nil
        
        // 1. 조건문을 통해 옵셔널 언래핑
        if nickname == nil {
            print("닉네임에 문제가 있어요")
        } else {
            print("\(nickname!) 으로 설정합니다.")
        }
        
        // 2. 옵셔널 바인딩: if let / guard let
        // swift 5.7 if-let shorthand
        if let nickname {
            print("\(nickname) 으로 설정합니다.")
        } else {
            print("닉네임에 문제가 있어요")
        }
        
        if let age {
            print("나이가 \(age) 입니다")
        } else {
            print("나이에 문제가 있어요")
        }
        
        guard let age else {
            print("옵셔널 해제를 실패했습니다.")
            return
        }
        
        // 3. ??
        print(nickname ?? "손님")
        
        // 4. 옵셔널 체이닝
        print(wordTextField.text?.count) // text가 nil이면 count까지 진행하지 않음
        
        if let text = wordTextField.text {
            print(text)
        }
        
    }
}

