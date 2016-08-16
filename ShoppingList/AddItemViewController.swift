//
//  ListViewController.swift
//  ShoppingList
//
//  Created by Richard Ni on 2016-08-10.
//  Copyright © 2016 Richard Ni. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var listTitle: UITextField!
    
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var quantity: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddItemViewController.tap(_:)))
        view.addGestureRecognizer(tapGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func addItemButton(sender: UIButton) {
        print("Button was pressed")
        
        if ((itemName.text == "") || (quantity.text == "")) {
            let alert = UIAlertController(title: "Hang on!", message: "Looks like you forgot to fill something out.", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "Got it", style: .Default, handler: nil)
            
            alert.addAction(alertAction)
            presentViewController(alert, animated: true, completion: nil)
        } else {
            shoppingList.addItem(itemName.text!, quantity: quantity.text!)
            self.view.endEditing(true)
            itemName.text = ""
            quantity.text = ""
            self.tabBarController?.selectedIndex = 1
        }

    }
    
    func tap(gesture: UITapGestureRecognizer) {
        itemName.resignFirstResponder()
        quantity.resignFirstResponder()
    }
    
    //Change back to main view controller
    @IBAction func backToHomeButton(sender: UIBarButtonItem) {
        let mainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Main")
        
        self.presentViewController(mainViewController!, animated: true, completion: nil)
    }
    
    //Change to Grocery List ViewController
    @IBAction func viewListButton(sender: UIBarButtonItem) {
        self.tabBarController?.selectedIndex = 1
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

