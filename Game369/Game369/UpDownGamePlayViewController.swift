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
        // TODO: - 아이템이 선택되지 않았을 경우 결과 확인 버튼 비활성화 조건 구현
        count += 1
        let selected = selectedItem!
        switch randomNumber {
        case selected:
            gameResult = .win
        case ..<selected:
            gameResult = .down
        case ...maxNumber!:
            gameResult = .up
        default:
            print("Unknown Range")
            gameResult = .inital
        }
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
        
        cell.configure(with: indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        selectedItem = indexPath.item
    }
}
