//
//  Person.swift
//  ContactBook
//
//  Created by Noel Mowatt Jr. on 10/16/16.
//  Copyright © 2016 NoelMowattJr. All rights reserved.
//

import Foundation

//--Person validation error
enum PersonValidationError: Error{
    
}

//--Represents each person in contact book
class Person{
    
    //--made properties private to validate data before
    //--they are set and read outside the class
    private(set) var fName: String?
    private(set) var lName: String?
    private(set) var myAddress: String?
    private(set) var myPhone: String?
    private(set) var myEmail: String?
    
    //--initializer
    init(fName fn: String) {
        fName = fn
    }
    
    //--Allows outside world to set the properties
    func setFirstName(fn: String) {
        fName = fn
    }
}
