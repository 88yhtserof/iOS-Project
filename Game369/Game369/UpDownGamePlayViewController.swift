//
//  UpDownGamePlayViewController.swift
//  Game369
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

class UpDownGamePlayViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var resultButton: UIButton!
    private lazy var dismissBarButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissButtonDidTapped))
    
    var maxNumber: Int?
    private lazy var numbers: [Int] = Array(1...(maxNumber ?? 1))
    
    static let identifier = String(describing: UpDownGamePlayViewController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        configureCollectionView()
    }
    
    private func configureSubviews() {
        navigationItem.leftBarButtonItem = dismissBarButtonItem
        
        titleLabel.text = "UpDown"
        subtitleLabel.text = "시도 횟수:"
        countLabel.text = "0"
        
        var config = resultButton.configuration
        config?.title = "결과 확인하기"
        config?.baseForegroundColor = .white
        config?.baseBackgroundColor = .black
        resultButton.configuration = config
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let id = "CircleCollectionViewCell"
        let xib = UINib(nibName: id, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: id)
        
        collectionView.collectionViewLayout = configureCollectionViewFlowLayout()
    }
    
    private func configureCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: 50, height: 50)
        return layout
    }
    
    @objc
    func dismissButtonDidTapped() {
        dismiss(animated: true)
    }
}

//MARK: - CollectionView Delegate
extension UpDownGamePlayViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CircleCollectionViewCell", for: indexPath) as? CircleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: indexPath.item)
        
        return cell
    }
    
    
}
