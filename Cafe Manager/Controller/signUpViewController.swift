//
//  signUpViewController.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-27.
//

import UIKit
import Firebase
import Loaf

class signUpViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        
    }
    

    @IBAction func signUpPressed(_ sender: UIButton) {
        
        if !InputValidator.isValidName(name: txtName.text ?? "") {
            Loaf("Invalid user Name" , state: .error, sender: self).show()
            return
            
        }
                
        if !InputValidator.isValidEmail(email: txtEmail.text ?? "") {
            Loaf("Invalid Email Address" , state: .error, sender: self).show()
            return
            
        }
        if !InputValidator.isValidMobileNo(txtPhone.text ?? "") {
            Loaf("Invalid user Mobile Number" , state: .error, sender: self).show()
            return
            
        }

        if !InputValidator.isValidPassword(pass:txtPassword.text ?? "", minLength: 6, maxLength: 20) {
            Loaf("Invalid user Password" , state: .error, sender: self).show()
            return
            
        }
        
        let user = manager(managerName: txtName.text ?? "", managerEmail: txtEmail.text ?? "", managerPassword: txtPassword.text ?? "", managerPhone: txtPhone.text ?? "")
        
        userRegister(user: user)
        
    }
    @IBAction func SignInPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func userRegister (user : manager){
        
        Auth.auth().createUser(withEmail: user.managerEmail, password: user.managerPassword) { authResult, error in
            if let erro = error{
                print (erro.localizedDescription)
                Loaf("User signup failed" , state: .error, sender: self).show()
                return
            }
            
          
            self.saveData(user: user)
            }
        
        
    }
    
    func saveData (user: manager){
        
        let userData = [
            "UserName" : user.managerName,
            "UserEmail" : user.managerEmail,
            "Userphone" : user.managerPhone,
            "Userpassword" : user.managerPhone
        ]
        
        
        self.ref.child("users").child(user.managerEmail.replacingOccurrences(of: "@", with: "_")
                                        .replacingOccurrences(of: ".", with: "_")).setValue(userData){
            
            (error, ref) in
            
            if let err  = error {
                print(err.localizedDescription)
                Loaf ("User data not Saved on database", state: .error, sender: self).show()
                 return
                
            }
            
            Loaf ("User data Saved on database", state: .success, sender: self).show(){
            type in
            self.dismiss(animated: true, completion: nil)
            }
                                            
        }
        
    }
    

}
