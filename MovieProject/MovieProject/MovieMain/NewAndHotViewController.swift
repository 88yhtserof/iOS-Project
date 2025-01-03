//
//  NewAndHotViewController.swift
//  MovieProject
//
//  Created by 임윤휘 on 12/27/24.
//

import UIKit

class NewAndHotViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var guideTitleLabel: UILabel!
    @IBOutlet var guideSubtitleLabel: UILabel!
    
    private let subtitles = [
        "죄송합니다. 아직 공개 예정 작품이 없습니다.",
        "크리스마스에 함께 모여 시청하세요.",
        "한 번쯤 들어봤을 TOP 10 시리즈"
    ]
    
    private var selectedStateOfButtons = [ true, false, false ] {
        didSet {
            zip(buttons, selectedStateOfButtons)
                .forEach { (button, state) in
                    button.isSelected = state
                    button.backgroundColor = state ? .white : .black
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    func configureButtons() {
        zip(buttons, selectedStateOfButtons)
            .enumerated()
            .forEach { (index, element) in
                let (button, state) = element
                button.tag = index
                button.isSelected = state
                button.layer.cornerRadius = 15
                button.backgroundColor = state ? .white : .black
                button.setTitleColor(.black, for: .selected)
                button.setTitleColor(.white, for: .normal)
            }
    }
    
    @IBAction func newReleasesButtonDidTapped(_ sender: UIButton) {
        guard !sender.isSelected else { return }
        guideTitleLabel.text = sender.currentTitle
        guideSubtitleLabel.text = subtitles[sender.tag]
        updateAllButtonStates(selected: sender)
    }
    
    func updateAllButtonStates(selected button: UIButton) {
        guard let index = buttons.firstIndex(of: button) else { return }
        selectedStateOfButtons[index].toggle()
        (0..<selectedStateOfButtons.count)
            .filter{ $0 != index }
            .forEach{ selectedStateOfButtons[$0] = false }
    }
}
