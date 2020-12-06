//
//  DoctorMenuVC.swift
//  HackDuke_SymMom2
//
//  Created by David Li on 12/5/20.
//  Copyright © 2020 Hack Duke Keohane. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class DoctorMenuVC: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    let user_email = Auth.auth().currentUser?.email!
    
    @IBOutlet weak var SchedAppButton: UIButton!
    @IBOutlet weak var PatDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(user_email)
        self.emailLabel.text = user_email!
        SchedAppButton.layer.cornerRadius = 20
        PatDataButton.layer.cornerRadius = 20
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
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
