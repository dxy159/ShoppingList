//
//  ShoppingLists.swift
//  ShoppingList
//
//  Created by Richard Ni on 2016-08-11.
//  Copyright © 2016 Richard Ni. All rights reserved.
//

import Foundation

var listOfShoppingLists = ListOfShoppingLists()

class ListOfShoppingLists {
    
    var lists = [ShoppingList]()
    
    func addShoppingList(list: ShoppingList) {
        lists.append(list)
    }
    
}