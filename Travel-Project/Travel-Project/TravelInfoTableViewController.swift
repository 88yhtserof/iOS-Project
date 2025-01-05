//
//  TravelInfoTableViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/5/25.
//

import UIKit

class TravelInfoTableViewController: UITableViewController {
    
    private let travels = Travel.samples

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//MARK: - TableView Method
extension TravelInfoTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travel = travels[indexPath.row]
        
        if travel.ad {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TravelAdTableViewCell.identifier) as? TravelAdTableViewCell else { return UITableViewCell() }
            cell.configure(with: travel)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TravelInfoTableViewCell.identifier) as? TravelInfoTableViewCell else { return UITableViewCell() }
            cell.configure(with: travel)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travels[indexPath.row].ad {
            return 100
        } else {
            return 150
        }
    }
}
