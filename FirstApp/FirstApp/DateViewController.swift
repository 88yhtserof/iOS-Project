//
//  DateViewController.swift
//  FirstApp
//
//  Created by 임윤휘 on 12/27/24.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var dateButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var buttonList: [UIButton]!
    @IBOutlet var emotionLabel: UILabel!
    
    var emotionList = [ "좋아해", "서운해", "속상해", "행복해" ]
    
    /*
     Date: 지역을 설정하지 않으면 영국 표준시를 기준으로 가진다.
     1. 그 나라에 맞는 시간대로 변경
     2. yyyy-MM-dd hh:mm:ss
        yy년 MM월 dd일 문자열로 변환해주어야 한다.
        -> DateFormatter 사용
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DateFormatter
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일 hh시 mm분 E"
        let result = format.string(from: datePicker.date)
        print(result)
        // DateFormatter를 사용하면 알아서 맞는 시간대로 뜬다
        
        // iOS15+ 생긴 간편한 함수
        print(datePicker.date.formatted())
        
        
        
        dateButtonTapped(dateButton)
// 나:     dateButton.sendActions(for: .touchUpInside)
            // 바로 함수를 출력할 수 있음에도 액션을 보내 호출하는 것이니깐 비효율적인가?
        // 그렇지 않다. 그 두 차이를 느끼기엔 아이폰이 성능이 좋다
        
//        for item in buttonList {
//            item.backgroundColor = .red
//            item.setTitle("Jack", for: .normal)
//        }
        
        for i in 0...3 {
            buttonList[i].backgroundColor = .red
            buttonList[i].setTitle(emotionList[i], for: .normal)
        }
    }
    
    @IBAction func dateButtonTapped(_ sender: UIButton) {
        resultLabel.text = "\(datePicker.date) 입니다"
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        resultLabel.text = "\(sender.date) 입니다"
    }
    
    @IBAction func keyboardDismiss(_ sender: Any) {
        // 버튼과 탭 제스터가 같은 동작을 수행할 때, 액션의 주체의 타입을 Any 타입으로 해서 두 객채 모두 한 액션에 연결될 수 있게 만들 수 있다.
        view.endEditing(true)
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        // 어떤 버튼을 클릭했는지 어떻게 알까?
        // 1. sender의 현재 title 사용하기
        print(sender.currentTitle!)
        
//        emotionLabel.text = sender.currentTitle
        
        // 2. 조건문을 사용한 방식
//        let value = sender.currentTitle
//        
//        if value == "좋아해" {
//            emotionLabel.text = "좋아해 라고 클릭했어요"
//        } else if value == "서운해" {
//            emotionLabel.text = "서운해 라고 클릭했어요"
//        } else {
//            emotionLabel.text = "~ 라고 클릭했어요"
//        }
        
        // 3. sender.tag를 사용하기
        print(sender.tag)
        emotionLabel.text = emotionList[sender.tag]
    }
    
}
