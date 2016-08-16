//
//  GroceryListViewController.swift
//  ShoppingList
//
//  Created by Richard Ni on 2016-08-10.
//  Copyright © 2016 Richard Ni. All rights reserved.
//

import UIKit

class GroceryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var list: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Returning to view
    override func viewWillAppear(animated: Bool) {
        list.reloadData()
    }
    
    //UITableViewDelete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            print("Deleted row")
            shoppingList.items.removeAtIndex(indexPath.row)
            list.reloadData()
        }
    }
    
    //UITableViewDataSource
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.items.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        cell.textLabel?.text = shoppingList.items[indexPath.row].itemName
        cell.detailTextLabel?.text = "Required amount: \(shoppingList.items[indexPath.row].quantity)"
        
        
        return cell
        
    }
    
    //Switch to AddItems view controller
    @IBAction func addItemSwitchTabButton(sender: UIBarButtonItem) {
        self.tabBarController?.selectedIndex = 0
    }
    
    //Add list to list of lists array, set shopping list back to empty array, navigate back to main screen
    @IBAction func saveList(sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Give it a name!", message: "Would you like to give your shopping list a name?", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.text! = "Shopping List \(listOfShoppingLists.listOfLists.count + 1)"
        }
        alertController.addAction(UIAlertAction(title: "Done", style: .Default, handler: { (action) in
            let textField = alertController.textFields![0] as UITextField
            print(textField.text!)
            
            listOfShoppingLists.addShoppingList(shoppingList)
            listOfShoppingLists.listOfLists.last?.name = textField.text!
            
            let date = NSDate()
            let calender = NSCalendar.currentCalendar()
            let year = calender.component(.NSYearCalendarUnit, fromDate: date)
            let month = calender.component(.NSMonthCalendarUnit, fromDate: date)
            let day = calender.component(.NSDayCalendarUnit, fromDate: date)
            listOfShoppingLists.listOfLists.last?.time = "\(month)/\(day)/\(year)"
            
            shoppingList.items = []
            
            let mainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Main")
            
            self.presentViewController(mainViewController!, animated: true, completion: nil)

        }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
