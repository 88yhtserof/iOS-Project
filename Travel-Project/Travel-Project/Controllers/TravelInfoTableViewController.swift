//
//  TravelInfoTableViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/5/25.
//

import UIKit

class TravelInfoTableViewController: UITableViewController {
    
    private var travels = Travel.samples

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func likeButtonDidTapped(_ sender: UIButton) {
        let row = sender.tag
        travels[row].like?.toggle()
        tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
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
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonDidTapped), for: .touchUpInside)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travel = travels[indexPath.row]
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if travel.ad {
            guard let travelInfoAdVC = mainStoryboard.instantiateViewController(withIdentifier: "TravelInfoAdViewController") as? TravelInfoAdViewController else { return }
            travelInfoAdVC.travelInfo = travel
            let navigationVC = UINavigationController(rootViewController: travelInfoAdVC)
            navigationVC.modalPresentationStyle = .fullScreen
            present(navigationVC, animated: true)
        } else {
            guard let travelInfoDetailVC = mainStoryboard.instantiateViewController(withIdentifier: "TravelInfoDetailViewController") as? TravelInfoDetailViewController else { return }
            travelInfoDetailVC.travelInfo = travel
            navigationController?.pushViewController(travelInfoDetailVC, animated: true)
        }
    }
}
