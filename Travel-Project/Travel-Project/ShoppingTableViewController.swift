//
//  ShoppingTableViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/5/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    @IBOutlet var tableHeaderView: UIView!
    @IBOutlet var addTextField: UITextField!
    
    private var shoppings = Shopping.samples

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        tableHeaderView.cornerRadius(5)
    }
    
    @IBAction func addTextFieldDidEndOnExit(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @IBAction func addButtonDidTapped(_ sender: UIButton) {
        guard let text = addTextField.text else { return }
        let shopping = Shopping(title: text)
        shoppings.append(shopping)
        tableView.reloadData()
        view.endEditing(true)
    }
    
    @objc func checkButtonDidTapped(_ sender: UIButton) {
        let row = sender.tag
        shoppings[row].check.toggle()
        tableViewReload(at: row)
    }
    
    @objc func bookmarkButtonDidTapped(_ sender: UIButton) {
        let row = sender.tag
        shoppings[row].bookmark.toggle()
        tableViewReload(at: row)
    }
    
    private func tableViewReload(at row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}

//MARK: - TableView Method
extension ShoppingTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier) as? ShoppingTableViewCell else { return UITableViewCell() }
        
        let row = indexPath.row
        let shopping = shoppings[row]
        cell.configure(with: shopping)
        
        [ cell.checkButton, cell.bookmarkButton ]
            .forEach{ $0?.tag = row }
        cell.checkButton.addTarget(self, action: #selector(checkButtonDidTapped), for: .touchUpInside)
        cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonDidTapped), for: .touchUpInside)
        
        return cell
    }
}
