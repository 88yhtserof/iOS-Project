//
//  EmotionCountingViewController.swift
//  EmotionDiary
//
//  Created by 임윤휘 on 12/26/24.
//

import UIKit

class EmotionCountingViewController: UIViewController {
    //MARK: - View
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var countingLabels: [UILabel]!
    
    //MARK: -  LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureSegmentedControl()
    }
    
    //MARK: - Configure
    func configureData() {
        guard let countings = UserDefaults.standard.array(forKey: "EmotionCountings") as? [Int] else {
            print("Failed to get emotion countings")
            return
        }
        zip(countingLabels, countings)
            .forEach{
                $0.text = String($1)
            }
    }
    
    func configureSegmentedControl() {
        segmentedControl.setTitle("랜덤", forSegmentAt: 0)
        segmentedControl.setTitle("카운팅", forSegmentAt: 1)
    }
    
    //MARK: - Action
    @IBAction func emotionButtonDidTouchUpInside(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else { return }
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            countEmotionRandomly(at: index)
        case 1:
            countEmotion(at: index)
        default:
            return
        }
        
        let countings: [Int] = countingLabels.map{ Int($0.text ?? "0")! }
        UserDefaults.standard.set(countings, forKey: "EmotionCountings")
        
    }
    
    @IBAction func resetButtonDidTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "EmotionCountings")
        countingLabels
            .forEach{ $0.text = "0" }
    }
    
    //MARK: - Method
    func countEmotionRandomly(at index: Int) {
        // 2단계: 감정 버튼 클릭 횟수 표시하기(랜덤)
        let randomNumStr = "\(Int.random(in: 0...99))"
        let label = countingLabels[index]
        label.text = randomNumStr
    }
    
    func countEmotion(at index: Int) {
        // 3단계: 감정 버튼 클릭 횟수 올리기
        let label = countingLabels[index]
        let before = Int(label.text ?? "0")!
        label.text = String(before + 1)
    }
}
