//
//  List.swift
//  ShoppingList
//
//  Created by Richard Ni on 2016-08-10.
//  Copyright © 2016 Richard Ni. All rights reserved.
//

import Foundation

var shoppingList = ShoppingList()

struct ShoppingItem {
    let itemName: String
    let quantity: String
}

class ShoppingList {
    
    var items = [ShoppingItem]()
    
    func addItem(itemName: String, quantity: String) {
        items.append(ShoppingItem(itemName: itemName, quantity: quantity))
    }
    
}