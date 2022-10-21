//
//  LoginController.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 08/10/21.
//

import UIKit
import Firebase


class LoginController{
    
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }

}

