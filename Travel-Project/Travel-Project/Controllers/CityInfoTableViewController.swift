//
//  CityInfoTableViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/6/25.
//

import UIKit

class CityInfoTableViewController: UITableViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var searchTextField: UITextField!
    
    private let cities = City.cities
    private lazy var domesticCities =  cities.filter({ $0.domestic_travel })
    private lazy var internationalCities = cities.filter({ !$0.domestic_travel })
    private var searchedCities: [City]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
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
    
    @IBAction func searchButtonDidTapped(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    @IBAction func searchTextFieldDidEndOnExit(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @IBAction func segmentedControlDidSelected(_ sender: UISegmentedControl) {
        let searchedWord = searchTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if !searchedWord.isEmpty {
            search()
        } else {
            tableView.reloadData()
        }
    }
    
    @IBAction func searchTextFieldEditingChanged(_ sender: UITextField) {
        search()
    }
    
    func search() {
        let searchedWord = searchTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if searchedWord.isEmpty {
            searchedCities = nil
            return
        }
        guard let kind = City.Kind(rawValue: segmentedControl.selectedSegmentIndex) else {
            print("Unknown section")
            return
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
        
        searchedCities = basedCities.filter { city in
            city.city_name.lowercased().contains(searchedWord) || city.city_english_name.lowercased().contains(searchedWord) || city.city_explain.lowercased().contains(searchedWord)
        }
        
        tableView.reloadData()
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
        cell.configure(with: city)
        return cell
    }
}
