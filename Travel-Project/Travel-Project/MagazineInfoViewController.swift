//
//  MagazineInfoViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineInfoViewController: UITableViewController {
    
    private var magazines = Magazine.samples

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
    }
}

//MARK: - TableView Method
extension MagazineInfoViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MagazineInfoTableViewCell.identifier) as? MagazineInfoTableViewCell else {
            print("Failed to cast cell")
            return UITableViewCell()
        }
        
        let magazine = magazines[indexPath.row]
        
        let imagStr = magazine.photo_image
        if let url = URL(string: imagStr) {
            cell.travelImageView.kf.setImage(with: url)
        } else {
            cell.travelImageView.image = UIImage(systemName: "photo")
        }
        
        cell.titleLabel.text = magazine.title
        cell.subtitleLabel.text = magazine.subtitle
        cell.dateLabel.text = magazine.date_description
        
        return cell
    }
}
