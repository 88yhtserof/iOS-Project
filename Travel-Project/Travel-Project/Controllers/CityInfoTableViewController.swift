//
//  CityInfoTableViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/6/25.
//

import UIKit

class CityInfoTableViewController: UITableViewController {
    //MARK: - View
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var searchTextField: UITextField!
    
    //MARK: - Properties
    private let cities = City.cities
    private lazy var domesticCities =  cities.filter({ $0.domestic_travel })
    private lazy var internationalCities = cities.filter({ !$0.domestic_travel })
    private var searchedCities: [City]?
    var ranges: [[NSRange]]?

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    //MARK: - Configure
    private func configureSubviews() {
        let nib = UINib(nibName: "CityInfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
        tableView.rowHeight = 130
        
        City.Kind.allCases
            .enumerated()
            .forEach { segment, kind in
                segmentedControl.setTitle(kind.title, forSegmentAt: segment)
            }
    }
    
    //MARK: - Action
    @IBAction func searchButtonDidTapped(_ sender: UIButton) {
        setUpInitialState()
    }
    
    @IBAction func searchTextFieldDidEndOnExit(_ sender: UITextField) {
        setUpInitialState()
    }
    
    @IBAction func segmentedControlDidSelected(_ sender: UISegmentedControl) {
        if !search() {
            tableView.reloadData()
        }
    }
    
    @IBAction func searchTextFieldEditingChanged(_ sender: UITextField) {
        search()
    }
    
    //MARK: - Method
    func setUpInitialState() {
        view.endEditing(true)
        if searchedCities == nil {
            tableView.reloadData()
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
        
        tableView.reloadData()
        return true
    }
}


//MARK: - TableView Method
extension CityInfoTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let kind = City.Kind(rawValue: segmentedControl.selectedSegmentIndex) else {
            print("Unknown section")
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier) as? CityInfoTableViewCell else {
            print("Could not cast cell")
            return UITableViewCell()
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
