//
//  ForgotPassViewController.swift
//  Cafe Manager
//
//  Created by Janani on 2021-04-30.
//

import UIKit
import Firebase

class ForgotPassViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func btnsendTapped(_ sender: UIButton) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailField.text!) { (error) in
            if let error = error {
                
                
                
                return
            }
        }
    }
    
}
