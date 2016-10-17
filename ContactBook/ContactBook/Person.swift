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
    case InvalidFirstName
    case InvalidAddress
    case InvalidPhone
    case InvalidEmail
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
    //--this initializer can fail and not return any value
    //--hence the ? after init
    init?(fName fn: String) {
        //--fName = fn
        do {
            try setFirstName(fn: fn)
        } catch{
            //--error catch
            return nil
        }
    }
    
    //-------------------VALIDATION FUNCTIONS------------------//
    //--Allows outside world to set the properties
    /*  throws tells the compiler there is a possibility that
        an error will get thrown    */
    func setFirstName(fn: String) throws {
        //--if characters of firstname is less 1
        if (fn.characters.count < 1){
            //--throw an error
            throw PersonValidationError.InvalidFirstName
        }
        fName = fn
    }
    //--last name isn't priority so no validation for now
    func setLastName(ln: String) throws {
        lName = ln
    }
    
    func setAddress(ad: String) throws{
        //--characters should not be equal to zero
        if (ad.characters.count != 0){
            //--Address should have at least 3 characters
            if (ad.characters.count < 3){
                throw PersonValidationError.InvalidAddress
            }
            //--validate there is a space between certain characters
            if let _ = ad.characters.index(of: " "){
                
            } else {
                throw PersonValidationError.InvalidAddress
            }
        }
        myAddress = ad
    }
    
    func setPhone(pn: String) throws {
        //--if not 0 then continue to test it
        if (pn.characters.count != 0) {
            
            //--reg. expression for testing the value
            let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
            
            //--phoneTest will test itself against the reg. expression
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
            
            let results = phoneTest.evaluate(with: pn)
            
            //--if there isn't a result
            if (!results){
                throw PersonValidationError.InvalidPhone
            }
        }
        myPhone = pn
    }
    
    func setEmail(em: String) throws{
        //--if chars is not 0 thn continue to test
        if (em.characters.count != 0){
            
            //--Reg. expression for checking email
            let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
            
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            
            let results = emailTest.evaluate(with: em)
            
            if (!results){
                throw PersonValidationError.InvalidEmail
            }
            
        }
        myEmail = em
    }
    
    
    
    
}
