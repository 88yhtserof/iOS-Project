//
//  BrownViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/7/25.
//

import UIKit

class BrownViewController: UIViewController {
    @IBOutlet var testLabel: UILabel!
    
    // 1. Pass Data - 데이터를 받은 공간(프로퍼티 생성)
    var contents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Brown"
        // 3. Pass Data - 전달받은 값을 화면에 표시
        testLabel.text = contents
    }
    
    
    @IBAction func popButtonDidTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dimissButtonDidTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
