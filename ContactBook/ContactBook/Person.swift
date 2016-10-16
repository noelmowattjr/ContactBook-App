//
//  Person.swift
//  ContactBook
//
//  Created by Noel Mowatt Jr. on 10/16/16.
//  Copyright © 2016 NoelMowattJr. All rights reserved.
//

import Foundation

class Person{
    var fName: String?
    var lName: String?
    var myAddress: String?
    var myPhone: String?
    var myEmail: String?
    
    //--initializer
    init(fName fn: String) {
        fName = fn
    }
}
