//
//  AddViewController.swift
//  ContactBook
//
//  Created by Noel Mowatt Jr. on 10/16/16.
//  Copyright © 2016 NoelMowattJr. All rights reserved.
//

import Foundation
import UIKit

//--Define new class
/*  This view controller will be displayed when i want to add
    a new contact to my contact book */

class AddViewController: UIViewController, UITextFieldDelegate{
    
    //--Outlet name field 
    @IBOutlet weak var nameField: UITextField!
    
    //--Add button func
    @IBAction func AddButtonPressed(sender: UIButton){
        print("Add button pressed")
        
        //--Dismiss keyboard when Add button pressed
        nameField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //--Dismiss keyboard delegate setup
        nameField.delegate = self
    }
    
    //--Dismiss keyboard when view is tapped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(false)
    }
    
    //--Dismiss keyboard when Return key is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return false
    }
    
}
