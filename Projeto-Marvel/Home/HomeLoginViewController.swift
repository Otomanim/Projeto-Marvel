//
//  ViewController.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 12/08/21.
//

import UIKit

class HomeLoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.borderButton()
        self.registerButton.borderButton()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginViewController", sender: nil)
    }
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RegisterViewController", sender: nil)
    }
    
}


