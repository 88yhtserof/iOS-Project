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
    
    enum UpDownGameResult {
        case inital, up, down, win
        
        var title: String {
            switch self {
            case .inital:
                return "UpDown"
            case .up:
                return "Up"
            case .down:
                return "Down"
            case .win:
                return "Win"
            }
        }
    }

    
    var maxNumber: Int?
    private lazy var numbers: [Int] = Array(1...(maxNumber ?? 1))
    private lazy var randomNumber: Int = numbers.randomElement()!
    private var count: Int = 0 {
        didSet {
            countLabel.text = String(count)
        }
    }
    private var gameResult: UpDownGameResult = .inital {
        didSet {
            titleLabel.text = gameResult.title
        }
    }
    private var selectedItem: Int?
    private var selectedIndex: Int?
    
    static let identifier = String(describing: UpDownGamePlayViewController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        configureCollectionView()
    }
    
    private func configureSubviews() {
        navigationItem.leftBarButtonItem = dismissBarButtonItem
        
        titleLabel.text = gameResult.title
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
    
    @IBAction func resultButtonDidTapped(_ sender: UIButton) {
        count += 1
        
        switch randomNumber {
        case selectedItem!:
            gameResult = .win
            numbers = [numbers[selectedIndex!]]
        case ..<selectedItem!:
            gameResult = .down
            numbers = Array(numbers[..<selectedIndex!])
        case ...maxNumber!:
            gameResult = .up
            numbers = Array(numbers[(selectedIndex! + 1)..<numbers.endIndex])
        default:
            print("Unknown Range")
            gameResult = .inital
        }
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
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as? CircleCollectionViewCell else {
            return UICollectionViewCell()
        }
        let number = numbers[indexPath.item]
        cell.configure(with: number)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        resultButton.isEnabled = true
        selectedItem = numbers[indexPath.item]
        selectedIndex = numbers.firstIndex(of: selectedItem!)
    }
}
