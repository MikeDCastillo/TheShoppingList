//
//  ShoppingListTableViewController.swift
//  TheList
//
//  Created by Michael Castillo on 2/17/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, ShoppingListTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Alert Controller Called
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "I pity the foo' who doesnt use this alert controller!", message: "input item Foo'!", preferredStyle: .alert)
        
        var itemsToInput: UITextField?
        
        alertController.addTextField { (txtField) in
            itemsToInput = txtField
        }
        
        let enterAction = UIAlertAction(title: "Enter Foo!", style: .default) {(_) in
            guard let item = itemsToInput?.text else { return }
            ListController.shared.create(item: item)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "You Scared foo!?", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(enterAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ListController.shared.item.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listViewCell", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell () }
        let item = ListController.shared.item[indexPath.row]
        cell.item = item
        cell.delegate = self
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let item = ListController.shared.item[indexPath.row]
            ListController.shared.delete(item: item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ShoppingListTableViewController {
    
    // MARK: - Protocol Required for Delegate
    func itemCellButtonTapped(sender: ShoppingListTableViewCell) {
        
        guard let item = sender.item, let indexPath = tableView.indexPath(for: sender) else { return }
        ListController.shared.buttonIsToggledForPurchase(item: item)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
