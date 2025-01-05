//
//  ShoppingTableViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/5/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    private var shoppings = Shopping.samples

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
    }
}

//MARK: - TableView Method
extension ShoppingTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier) as? ShoppingTableViewCell else { return UITableViewCell() }
        
        let shopping = shoppings[indexPath.row]
        cell.configure(with: shopping)
        
        return cell
    }
}
