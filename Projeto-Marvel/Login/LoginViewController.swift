//
//  LoginViewController.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 22/08/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let loginController = LoginController()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.borderTextField()
        self.passwordTextField.borderTextField()
        self.nextButton.borderButton()
        self.emailTextField.becomeFirstResponder()
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
       
    
        //        MARK:- TESTE CRASH Analytics
        //        let button = UIButton(type: .roundedRect)
        //             button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        //             button.setTitle("Test Crash", for: [])
        //             button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        //             view.addSubview(button)
        
    }
    //    MARK:- TESTE CRASH
    //    @IBAction func crashButtonTapped(_ sender: AnyObject) {
    //          let numbers = [0]
    //          let _ = numbers[1]
    //      }
    
    @IBAction func tappedVoltarButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HomeLoginViewController", sender: nil)
    }
    
    @IBAction func changePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        if passwordTextField.isSecureTextEntry {
            if let image = UIImage(systemName: "eye.fill") {
                sender.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "eye.slash.fill") {
                sender.setImage(image, for: .normal)
            }
        }
    }
    
    //MARK:- LoginUser
    @IBAction func tappedNextButton(_ sender: UIButton) {
        print("clicou no botão")
        let error = verifyTF()
        if error != nil {
            print("=======deu ruim=======")
            showError(mensagem: "Email ou senha não conferem")
                    }else {
            print("=======Auth======")
                        print(loginController)
                        authLogin(email: emailTextField?.text ?? "", password: passwordTextField?.text ?? "")
            
        }
    }
    
    func authLogin(email: String, password: String){


        Auth.auth().signIn(withEmail: email, password: password) { (result, errorCall) in
            if errorCall != nil {
                self.showError(mensagem: errorCall!.localizedDescription)
            } else {
                
                self.performSegue(withIdentifier: "HomeVC", sender: nil)
            }

        }
    }
    
    func goToHome(){
        self.performSegue(withIdentifier: "HomeVC", sender: nil)
        
    }
    
    func showError(mensagem: String){
        let _errorLabel = errorLabel
        _errorLabel?.alpha = 1
        _errorLabel?.text = mensagem
    }
    
    func verifyTF() -> String? {
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Preencha todos os campos"
    }
        let currentlyPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        if loginController.isPasswordValid(currentlyPassword) == false {
            return "Sua senha não esta valida, digite um senha com mais de 8 caracteres alpha numérico, com letras Maiusculas, Minusculas e caracteres especias."
        }

        return nil

    }

}
//    MARK: - Extension Delegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.emailTextField: self.passwordTextField.becomeFirstResponder()
        default: textField.resignFirstResponder()
        }
        return true
    }
    
}









