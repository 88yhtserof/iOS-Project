//
//  NpayViewController.swift
//  AutoLayoutPractice
//
//  Created by 임윤휘 on 1/1/25.
//

import UIKit

class NpayViewController: UIViewController {
    @IBOutlet var indicatorView: UIView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [ indicatorView, popUpView, okButton ]
            .forEach{ cornerRadius($0) }
        
        
    }
    
    func cornerRadius(_ view: UIView) {
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }
}
