//
//  Controller.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 24/08/21.
//
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import CryptoKit

class Controller: NSObject {

// MARK:- Validation for password
    

    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    
}
