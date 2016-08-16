//
//  List.swift
//  ShoppingList
//
//  Created by Richard Ni on 2016-08-10.
//  Copyright © 2016 Richard Ni. All rights reserved.
//

import Foundation

var shoppingList = ShoppingList()

var listOfShoppingLists = ListOfShoppingLists()

struct ShoppingItem {
    let itemName: String
    let quantity: String
}

class ShoppingList {
    
    var items = [ShoppingItem]()
    var name = "Shopping List \(listOfShoppingLists.listOfLists.count)"
    var time = String()
    
    func addItem(itemName: String, quantity: String) {
        items.append(ShoppingItem(itemName: itemName, quantity: quantity))
    }
    
}

class ListOfShoppingLists {
    
    var listOfLists = [ShoppingList]()
    
    func addShoppingList(shoppingList: ShoppingList) {
        listOfLists.append(shoppingList)
    }
    
}