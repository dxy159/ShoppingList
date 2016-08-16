//
//  ListOfShoppingListsViewController.swift
//  ShoppingList
//
//  Created by Richard Ni on 2016-08-15.
//  Copyright © 2016 Richard Ni. All rights reserved.
//

import UIKit

class ListOfShoppingListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lists: UITableView!
    
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
        lists.reloadData()
    }

    
    //UITableViewDelete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            print("Deleted row")
            listOfShoppingLists.listOfLists.removeAtIndex(indexPath.row)
            lists.reloadData()
        }
    }

    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfShoppingLists.listOfLists.count
    }

    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "Default")
        cell.textLabel?.text = listOfShoppingLists.listOfLists[indexPath.row].name
        cell.detailTextLabel?.text = listOfShoppingLists.listOfLists[indexPath.row].time
        
        return cell
    }
    
    @IBAction func backButton(sender: UIBarButtonItem) {
        
        let mainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Main")
        
        self.presentViewController(mainViewController!, animated: true, completion: nil)

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
