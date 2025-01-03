//
//  BuzzwordSearchViewController.swift
//  BuzzwordSearch
//
//  Created by 임윤휘 on 12/28/24.
//

import UIKit

class BuzzwordSearchViewController: UIViewController {
    //MARK: - View
    @IBOutlet var searchBarView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchResultLabel: UILabel!
    @IBOutlet var topSearchedButtons: [UIButton]!
    
    //MARK: - Properties
    private let samples = [
        "마상": "마음의 상처",
        "그 잡채": "그 자체",
        "추구미": "추구하고자 하는 아름다움",
        "내또출": "내일 또 출근함",
        "TMI": "너무 과한 정보",
        "아아": "아이스 아메리카노",
        "소확행": "소소하지만 확실한 행복",
        "갑분싸": "갑자기 분위기 싸해짐",
        "캘박": "캘린더에 박제"
    ]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchBar()
        configureTopSearched()
        configureSearchResult()
    }
    
    //MARK: - Configure
    private func configureSearchBar() {
        searchBarView.layer.borderColor = UIColor.black.cgColor
        searchBarView.layer.borderWidth = 1
        
        searchTextField.borderStyle = .none
        searchTextField.placeholder = "검색어를 입력하세요"
        searchTextField.tintColor = .black
        searchTextField.returnKeyType = .search
        
        let image = UIImage(systemName: "magnifyingglass")
        searchButton.setTitle("", for: .normal)
        searchButton.setImage(image, for: .normal)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
    }
    
    private func configureTopSearched() {
        let titles = randomeSearchData(count: topSearchedButtons.count)
        zip(topSearchedButtons, titles)
            .forEach{ button, title in
                button.setTitle(title, for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.borderWidth = 1
                button.layer.cornerRadius = 10
                button.clipsToBounds = true
            }
    }
    
    private func configureSearchResult() {
        searchResultLabel.text = "검색 결과가 없습니다"
        searchResultLabel.font = .systemFont(ofSize: 20, weight: .medium)
        searchResultLabel.numberOfLines = 0
        searchResultLabel.textAlignment = .center
    }
    
    //MARK: - Action
    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func searchTextFieldReturnKeyDidTapped(_ sender: UITextField) {
        search()
    }
    
    @IBAction func searchButtonDidTapped(_ sender: UIButton) {
        search()
    }
    
    @IBAction func topSearchedDidTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        search(for: title)
    }
    
    //MARK: - Method
    
    /// Search a given word and cause the view to resign the first responder status.
    func search(for word: String) {
        let key = word
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()
        let result = samples[key] ?? "검색 결과가 없습니다"
        searchResultLabel.text = result
        view.endEditing(true)
    }
    
    func search() {
        guard let text = searchTextField.text else { return }
        search(for: text)
    }
    
    /// Return top searched list to set An unordered collection of unique elements randomly.
    func randomeSearchData(count: Int) -> [String] {
        var topSearchedNumbers: Set<String> = []
        (0..<count)
            .forEach { _ in
                var title: String
                repeat {
                    title = samples.keys.randomElement()!
                } while topSearchedNumbers.contains(title)
                topSearchedNumbers.insert(title)
            }
        return Array(topSearchedNumbers)
    }
}

