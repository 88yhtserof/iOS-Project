//
//  MovieHomeViewController.swift
//  MovieProject
//
//  Created by 임윤휘 on 12/27/24.
//

import UIKit

class MovieHomeViewController: UIViewController {
    @IBOutlet var posterImageViews: [UIImageView]!
    @IBOutlet var top10BadgeImageViews: [UIImageView]!
    @IBOutlet var newSeriesLabels: [UILabel]!
    @IBOutlet var newEpisodeLabels: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePosterImageView()
    }
    
    func configurePosterImageView() {
        posterImageViews
            .forEach {
                $0.layer.cornerRadius = 16
                $0.clipsToBounds = true
                $0.layer.borderColor = UIColor.gray.cgColor
                $0.layer.borderWidth = 1
            }
    }
    
    @IBAction func playButtonDidTapped(_ sender: UIButton) {
        posterImageViews
            .forEach {
                let randomNumber = Int.random(in: 1...5)
                $0.image = UIImage(named: "\(randomNumber)")
            }
        
        top10BadgeImageViews
            .forEach { $0.isHidden = Bool.random() }
        
        zip(newSeriesLabels, newEpisodeLabels)
            .forEach {
                let randomState = Bool.random()
                $0.0.isHidden = randomState
                $0.1.isHidden = [!randomState, true].randomElement()!
                /*
                 (newSeriesViews, newEpisodeViews)가 가질 수 있는 isHidden 상태
                 - 보이는가?: 각 뷰의 isHidden 상태
                 - x x: true true
                 - o x: false true
                 - x o: true false
                 * 둘다 동시에 보이면 안 됨
                 */
            }
    }
}
