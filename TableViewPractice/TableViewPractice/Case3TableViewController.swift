//
//  Case3TableViewController.swift
//  TableViewPractice
//
//  Created by 임윤휘 on 1/2/25.
//

import UIKit

class Case3TableViewController: UITableViewController {
    @IBOutlet var addTextField: UITextField!
    
    private var shoppingList = [ Shopping(title: "맥북 구매", isDone: false),
                                 Shopping(title: "아이폰 구매", isDone: true)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonDidTapped(_ sender: UIButton) {
        guard let text = addTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !text.isEmpty else { return }
        let shopping = Shopping(title: text, isDone: false)
        shoppingList.append(shopping)
        tableView.reloadData()
        addTextField.text = ""
    }
    
    
    @IBAction func addTextFieldReturnKeyDidTapped(_ sender: UITextField) {
        view.endEditing(true)
    }
}

//MARK: -  TableViewDelegate
extension Case3TableViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Setting.Header(rawValue: section) else {
            print("Unknown Section")
            return nil
        }
        return section.title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "case-3-identifier") else { return UITableViewCell() }
        
        let shopping = shoppingList[indexPath.row]
        cell.textLabel?.text = shopping.title
        cell.accessoryType = shopping.isDone ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        shoppingList[indexPath.row].isDone.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

struct Shopping {
    let title: String
    var isDone: Bool
}
