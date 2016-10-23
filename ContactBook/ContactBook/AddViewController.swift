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
    
    //--Outlet fields
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    //--Add button func
    @IBAction func AddButtonPressed(sender: UIButton){
        print("Add button pressed")
        
        //--Dismiss keyboard when Add button pressed
        nameField.resignFirstResponder()
        
        if let p = Person(fName: nameField.text!){
            print("Created a person: \(p.fName)")
            
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Error creating Person")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //--Dismiss keyboard delegate setup
        nameField.delegate = self
        lastField.delegate = self
        phoneField.delegate = self
        emailField.delegate = self
        addressField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dissMissKeyboard))
        //--Add to view
        view.addGestureRecognizer(tap)
    }
    
    //--Selector to dismiss keyboard
    func dissMissKeyboard(){
        view.endEditing(true)
    }
    
    //--Dismiss keyboard when view is tapped
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(false)
//    }
    
    //--Dismiss keyboard when Return key is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
}
