//
//  TravelInfoAdViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/7/25.
//

import UIKit

class TravelInfoAdViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    private lazy var closeBarButtonItem: UIBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeBarButtonItemDidTapped))
    
    var travelInfo: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
    
    private func configureSubviews() {
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        if let travelInfo {
            titleLabel.text = travelInfo.title
        }
        
        navigationItem.leftBarButtonItem = closeBarButtonItem
        navigationItem.title = "광고 상세"
    }
    
    @objc
    func closeBarButtonItemDidTapped() {
        dismiss(animated: true)
    }
}
