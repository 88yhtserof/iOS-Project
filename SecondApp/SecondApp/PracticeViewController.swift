//
//  PracticeViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 12/31/24.
//

import UIKit

class PracticeViewController: UIViewController {

    let colorList: [UIColor] = [.red, .yellow, .blue, .green ]

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = colorList.randomElement()!
        print(self, #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        view.backgroundColor = colorList.randomElement()!
        print(self, #function)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = colorList.randomElement()!
        print(self, #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self, #function)
    }
    
    // 스토리보드에서 연결하는게 아니라, 코드로 직접 타이핑
    // 터널. Unwind
    // 열었던 화면에서 함수 작성
    // 어떤 화면이더라도 버튼이랑 연결하면 화면을 사라지게 해주겠다
    @IBAction func unwindToPracticeViewController(_sender: UIStoryboardSegue) {
        print(#function)
    }
}
