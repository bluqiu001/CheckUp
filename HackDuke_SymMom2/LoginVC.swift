//
//  LoginVC.swift
//  HackDuke_SymMom2
//
//  Created by David Li on 12/5/20.
//  Copyright © 2020 Hack Duke Keohane. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        
        print(username.text!)
        print(password.text!)
        Auth.auth().createUser(withEmail: username.text!, password: password.text!) { user, error in
          if error == nil {
            // 3
            Auth.auth().signIn(withEmail: self.username.text!,
                               password: self.password.text!)
          }
        }
    }

}
