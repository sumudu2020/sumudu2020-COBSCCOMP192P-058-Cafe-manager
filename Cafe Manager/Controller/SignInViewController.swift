//
//  SignInViewController.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-26.
//

import UIKit
import Firebase
import Loaf

class SignInViewController: UIViewController {
    var ref: DatabaseReference!

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        
    }
    

    @IBAction func signInPressed(_ sender: UIButton) {
        if !InputValidator.isValidEmail(email: txtEmail.text ?? "") {
            Loaf("Invalid Email Address" , state: .error, sender: self).show()
            return
            
        }
        if !InputValidator.isValidPassword(pass:txtPassword.text ?? "", minLength: 6, maxLength: 20) {
            Loaf("Invalid user Password" , state: .error, sender: self).show()
            return
            
        }
        Userauthenticate(email:txtEmail.text!, password: txtPassword.text!)
        
        
       
        }
    
  
    
    func Userauthenticate(email: String,password: String){
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
          
            if let erro = error {
                print(erro.localizedDescription)
                Loaf("User name or password is invalid" , state: .error, sender: self).show()
                return
            }
            if let email = authResult?.user.email {
                self.getUserData(email: email)
                }
            else{
                Loaf ("User email not found", state: .error, sender: self).show()
                return
                
            }
        
        }
        
    }
    
    func getUserData(email : String){
        ref.child("users")
            .child(email
                    .replacingOccurrences(of: "@", with: "_")
                    .replacingOccurrences(of: ".", with: "_")).observe(.value, with: {
                                        (snapshot)  in
                        
                        if snapshot.hasChildren(){
                            if let data = snapshot.value {
                                if let userData = data as? [String : String] {
                                   
                                        let user = manager(
                                                           managerName: userData ["UserName"]! ,
                                                           managerEmail: userData ["UserEmail"]! ,
                                                           managerPassword: userData ["Userphone"]!,
                                                           managerPhone: userData ["Userpassword"]!)
                                    
                                    let sessionMGR = SessionManager()
                                    sessionMGR.SaveManagerLogin(user: user)
                                    self.performSegue(withIdentifier: "SignInToHome", sender: nil)
                                }
                                
                            }
                            
                            
                            
                        } else{
                            
                            Loaf ("User not found", state: .error, sender: self).show()
                            
                        }
                    })
                             
        
        
    }
    

    @IBAction func forgotPassTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "forgotPassSegue", sender: nil)
    }
}
