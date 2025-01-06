//
//  CityInfoTableViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/6/25.
//

import UIKit

class CityInfoTableViewController: UITableViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    private let cities = City.cities
    private lazy var domesticCities =  cities.filter({ $0.domestic_travel })
    private lazy var internationalCities = cities.filter({ !$0.domestic_travel })

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        
        let nib = UINib(nibName: "CityInfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
        tableView.rowHeight = 130
        
        ["모두", "국내", "해외"]
            .enumerated()
            .forEach { segment, title in
                segmentedControl.setTitle(title, forSegmentAt: segment)
            }
    }
    
}

//MARK: - TableView Method
extension CityInfoTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier) as? CityInfoTableViewCell else {
            print("Could not cast cell")
            return UITableViewCell()
        }
        let city = cities[indexPath.row]
        cell.configure(with: city)
        
        return cell
    }
}
