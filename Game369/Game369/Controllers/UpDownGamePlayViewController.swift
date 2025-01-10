//
//  UpDownGamePlayViewController.swift
//  Game369
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

class UpDownGamePlayViewController: UIViewController {
    //MARK: - View
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var resultButton: UIButton!
    private lazy var dismissBarButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissButtonDidTapped))
    
    //MARK: - Properties
    var maxNumber: Int?
    private lazy var upDownGame = UpDownGame(max: maxNumber ?? 1)
    private var selectedItem: Int?
    
    static let identifier = String(describing: UpDownGamePlayViewController.self)
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        configureCollectionView()
    }
    
    //MARK: - Configuration
    private func configureSubviews() {
        navigationItem.leftBarButtonItem = dismissBarButtonItem
        
        titleLabel.text = upDownGame.title
        subtitleLabel.text = "시도 횟수:"
        countLabel.text = "0"
        
        var config = resultButton.configuration
        config?.title = "결과 확인하기"
        config?.baseForegroundColor = .white
        config?.baseBackgroundColor = .black
        resultButton.configuration = config
        resultButton.isEnabled = false
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let id = CircleCollectionViewCell.identifier
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
    
    //MARK: - Action
    @IBAction func resultButtonDidTapped(_ sender: UIButton) {
        titleLabel.text = upDownGame.play(selectedItem!)
        countLabel.text = String(upDownGame.count)
        collectionView.reloadSections(IndexSet(integer: 0))
        resultButton.isEnabled = false
    }
    
    @objc
    func dismissButtonDidTapped() {
        dismiss(animated: true)
    }
}

//MARK: - CollectionView Delegate
extension UpDownGamePlayViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upDownGame.numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as? CircleCollectionViewCell else {
            return UICollectionViewCell()
        }
        let number = upDownGame.numbers[indexPath.item]
        cell.configure(with: number)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        resultButton.isEnabled = true
        selectedItem = upDownGame.numbers[indexPath.item]
    }
}
