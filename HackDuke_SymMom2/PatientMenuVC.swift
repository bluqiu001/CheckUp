//
//  PatientMenuVC.swift
//  HackDuke_SymMom2
//
//  Created by David Li on 12/5/20.
//  Copyright © 2020 Hack Duke Keohane. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Foundation

class PatientMenuVC: UIViewController {
    let user_email = Auth.auth().currentUser?.email!
    
    let ref = Database.database().reference(withPath: "patient_appt")
    
    @IBOutlet weak var recSymButton: UIButton!
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel2: UILabel!
    
    override func viewDidLoad() {
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        recSymButton.layer.cornerRadius = 20

        self.emailLabel.text = user_email!
        let goodEmail = user_email!.replacingOccurrences(of: ".", with: "?")
        print(goodEmail)
        var date = ""
        ref.child(goodEmail).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            print(snapshot)
            let value = snapshot.value as? NSDictionary
            date = value?["date"] as? String ?? ""
            if (date == "") {
                self.dateLabel2.text  = "No appointment on record!"
                self.recSymButton.isHidden = true
            }
            else{
                self.dateLabel2.text = "Appt Date " + date
                self.recSymButton.isHidden = false

            }
          }) { (error) in
            print(error.localizedDescription)
        }
        super.viewDidLoad()
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

