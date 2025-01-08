//
//  CityInfoCircleViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/7/25.
//

import UIKit

class CityInfoCircleViewController: UIViewController {
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!
    
    private let cities = City.cities
    private lazy var domesticCities =  cities.filter({ $0.domestic_travel })
    private lazy var internationalCities = cities.filter({ !$0.domestic_travel })
    private var searchedCities: [City]?
    var ranges: [[NSRange]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        navigationItem.title = "인기 도시"
        let xib = UINib(nibName: CityInfoCircleCollectionViewCell.identifier, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: CityInfoCircleCollectionViewCell.identifier)
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        City.Kind.allCases
            .enumerated()
            .forEach { segment, kind in
                segmentedControl.setTitle(kind.title, forSegmentAt: segment)
            }
    }
    
    private func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        
        let itemWidth = (view.frame.width / 2) - 32 - 5
        let itemHeight = (view.frame.height / 3) - 32
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        return layout
    }
    
    @IBAction func searchButtonDidTapped(_ sender: UIButton) {
        setUpInitialState()
    }
    
    @IBAction func searchTextFieldDidEndOnExit(_ sender: UITextField) {
        setUpInitialState()
    }
    
    @IBAction func searchTextFieldEditingChanged(_ sender: UITextField) {
        search()
    }
    
    @IBAction func segmentedControlDidSelected(_ sender: UISegmentedControl) {
        if !search() {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Method
    func setUpInitialState() {
        view.endEditing(true)
        if searchedCities == nil {
            collectionView.reloadData()
        }
    }
    
    /// Search the text of text field and return the search result
    @discardableResult
    func search() -> Bool {
        guard let text = searchTextField.text,
              let search = Search(searchedWord: text) else {
            searchedCities = nil
            ranges = nil
            return false
        }
        guard let kind = City.Kind(rawValue: segmentedControl.selectedSegmentIndex) else {
            print("Unknown section")
            return false
        }
        
        var basedCities: [City]
        
        switch kind {
        case .all:
            basedCities = cities
        case .domestic:
            basedCities = domesticCities
        case .international:
            basedCities = internationalCities
        }
        
        searchedCities = basedCities
            .filter{ search.contains(within: [ $0.city_name, $0.city_english_name, $0.city_explain ]) }
        
        ranges = searchedCities?
            .map{ search.matches(within: [$0.first_city_name, $0.city_explain]) }
        
        collectionView.reloadData()
        return true
    }
}

//MARK: - CollectionView Delegate
extension CityInfoCircleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let kind = City.Kind(rawValue: segmentedControl.selectedSegmentIndex) else {
            print("Unknown section")
            return 0
        }
        
        if let searchedCities {
            return searchedCities.count
        }
        
        switch kind {
        case .all:
            return cities.count
        case .domestic:
            return domesticCities.count
        case .international:
            return internationalCities.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let kind = City.Kind(rawValue: segmentedControl.selectedSegmentIndex) else {
            print("Unknown section")
            return UICollectionViewCell()
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityInfoCircleCollectionViewCell.identifier, for: indexPath) as? CityInfoCircleCollectionViewCell else {
            print("Could not cast cell")
            return UICollectionViewCell()
        }
        
        let row = indexPath.row
        var city: City
        
        if let searchedCities {
            city = searchedCities[row]
        } else {
            switch kind {
            case .all:
                city = cities[row]
            case .domestic:
                city = domesticCities[row]
            case .international:
                city = internationalCities[row]
            }
        }
        
        cell.configure(with: city, ranges: ranges?[row])
        return cell
    }
    
    
}
