//
//  RegisterViewController.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 22/08/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    private var controller = Controller()
    
    //    MARK: - Outlet TextField
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    //    MARK: - Outlet Button
    
    @IBOutlet weak var nextButton: UIButton!
    
    //    MARK: - Outlet Scroll
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //    MARK: - LIFE CICLE View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.borderTextField()
        self.lastNameTextField.borderTextField()
        self.emailTextField.borderTextField()
        self.passwordTextField.borderTextField()
        self.confirmPasswordTextField.borderTextField()
        
        
        self.nextButton.borderButton()
        
        //        MARK: - Resgister
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    //    MARK: - Button
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
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
    @IBAction func tappedNextButton(_ sender: UIButton) {
        
        let error = verifyTextFields()
        
        
        if error != nil {
            showError(mensagem: error!)
//            mensagem de alert: error!
        }else {
            
            let nameTF = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastNameTF = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailTF = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let confirmPasswordTF = confirmPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: emailTF, password: confirmPasswordTF) { (result, errorCall) in
                if errorCall != nil {
                    self.showError(mensagem: "Não foi possível criar o usuario ")
//                mesagem de alert: "Não foi possível criar o usuario "
                } else {
                    let firestore = Firestore.firestore()
                    firestore.collection("users").addDocument(data: ["firstName": nameTF, "lastName": lastNameTF, "uid":result?.user.uid]) { (error) in
                        if error != nil {
                            self.showError(mensagem: "erro ao cadastrar o usuario")
                    
//                            mesagem de alert: "erro ao cadastrar o usuario"
                        }
                        
                    }
                    self.performSegue(withIdentifier: "LoginViewController", sender: nil)
                }
                    
            }
            
        }
        
    }
    func showError(mensagem: String) {
        errorLabel.alpha = 1
        errorLabel.text = mensagem
    }
    
    //    MARK: - Keybord scroll
    
    @objc func keyboardWillShow(notification:NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    //    MARK: -
    
    func verifyTextFields() -> String? {
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
//            mesagem de alert: "Preencha todos os campos "
            return "Preencha todos os campos"
        }
        let currentlyPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if  controller.isPasswordValid(currentlyPassword) == false {
//            mesagem de alert: "Sua senha não está valida, digite uma senha com mais de 8 caracteres"
            return "Sua senha não esta valida, digite um senha com mais de 8 caracteres."
        }
        return nil
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}



