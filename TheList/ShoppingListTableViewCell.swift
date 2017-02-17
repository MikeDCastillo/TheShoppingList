//
//  ShoppingListTableViewCell.swift
//  TheList
//
//  Created by Michael Castillo on 2/17/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var labelTextField: UILabel!

    weak var delegate: ShoppingListTableViewCellDelegate?
    
    var item: List? {
        didSet {
        updateCells()
        }
    }
    
    @IBAction func buttonImageTapped(_ sender: Any) {
        delegate?.itemCellButtonTapped(sender: self)
    }
    
    func updateCells() {
        guard let newItemLabel = item else {
            labelTextField.text = ""
        return }
            labelTextField.text = newItemLabel.item
        
        newItemLabel.didPurchase ? buttonOutlet.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal) : buttonOutlet.setImage(#imageLiteral(resourceName: "mrT"), for: .normal)
    }
}

@objc protocol ShoppingListTableViewCellDelegate {
    func itemCellButtonTapped (sender: ShoppingListTableViewCell)
}

