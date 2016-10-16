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

class AddViewController: UIViewController{
    
    //--Outlet name field 
    @IBOutlet weak var nameField: UITextField!
    
    //--Add button func
    @IBAction func AddButtonPressed(sender: UIButton){
        print("Add button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
