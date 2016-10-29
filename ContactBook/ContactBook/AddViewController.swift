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
    
    //--add Person class as property
    var person: Person?
    
    //--Add button func
    @IBAction func AddButtonPressed(sender: UIButton){
        print("Add button pressed")
        
        //--Testing to see if there is a person property set already
        if person == nil {
            if let p = Person(fName: nameField.text!){
                person = p
            } else {
                let alert = UIAlertController(title: "Error", message: "Error creating contact", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                    
                return
            }
        }
        
        do{
            try person!.setFirstName(fn: nameField.text!)
            try person!.setLastName(ln: lastField.text!)
            try person!.setPhone(pn: phoneField.text!)
            try person!.setEmail(em: emailField.text!)
            try person!.setAddress(ad: addressField.text!)
            
        } catch let error as PersonValidationError {
            var errorMsg = ""
            
            switch (error) {
            case .InvalidFirstName:
                errorMsg = "Invalid first name"
            case .InvalidPhone:
                errorMsg = "Invalid phone number"
            case .InvalidEmail:
                errorMsg = "Invalid email"
            case .InvalidAddress:
                errorMsg = "Invalid Address"
            }
            
            //--------
            let alert = UIAlertController(title: "Error", message: "Error creating contact", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            //--------
            
        } catch{
            
        }
        
        //--Dismiss keyboard when Add button pressed
        nameField.resignFirstResponder()

        //--if everything happens successfully then run this line
        self.navigationController?.popViewController(animated: true)
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
