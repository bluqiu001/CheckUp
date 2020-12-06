//
//  DoctorInfoVC.swift
//  HackDuke_SymMom2
//
//  Created by Billy Luqiu on 12/6/20.
//  Copyright © 2020 Hack Duke Keohane. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class DoctorInfoVC: UIViewController {
    
    let ref = Database.database().reference(withPath: "patient_data")

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var usernameAns: UILabel!
    @IBOutlet weak var headachesAns: UILabel!
    @IBOutlet weak var breathAns: UILabel!
    @IBOutlet weak var noseAns: UILabel!
    @IBOutlet weak var throatAns: UILabel!
    @IBOutlet weak var coughAns: UILabel!
    @IBOutlet weak var achesAns: UILabel!
    @IBOutlet weak var vomitAns: UILabel!
    @IBOutlet weak var tasteAns: UILabel!
    @IBOutlet weak var feverAns: UILabel!
    @IBOutlet weak var contactAns: UILabel!
    @IBOutlet weak var concernsAns: UILabel!
    
    @IBOutlet weak var leftStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftStackView.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitClick(_ sender: UIButton) {
        let goodEmail = email.text!.replacingOccurrences(of: ".", with: "?")
        
        ref.child(goodEmail).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            print(snapshot)
            self.leftStackView.isHidden = false
            let value = snapshot.value as? NSDictionary
            
            let aches = value?["aches"] as? Bool
            let breath = value?["breath"] as? Bool
            let contact = value?["contact"] as? Bool
            let cough = value?["cough"] as? Bool
            let fever = value?["fever"] as? Bool
            let headaches = value?["headaches"] as? Bool
            let nose = value?["nose"] as? Bool
            let taste = value?["taste"] as? Bool
            let throat = value?["throat"] as? Bool
            let vomit = value?["vomit"] as? Bool
            let username = value?["addedByUser"] as? String ?? ""
            let concerns = value?["concerns"] as? String ?? ""
            
            let aches_string = aches! ? "Yes" : "No"
            let breath_string = breath! ? "Yes" : "No"
            let contact_string = contact! ? "Yes" : "No"
            let cough_string = cough! ? "Yes" : "No"
            let fever_string = fever! ? "Yes" : "No"
            let headaches_string = headaches! ? "Yes" : "No"
            let nose_string = nose! ? "Yes" : "No"
            let taste_string = taste! ? "Yes" : "No"
            let throat_string = throat! ? "Yes" : "No"
            let vomit_string = vomit! ? "Yes" : "No"
            
            self.achesAns.text = aches_string
            self.breathAns.text = breath_string
            self.contactAns.text = contact_string
            self.coughAns.text = cough_string
            self.feverAns.text = fever_string
            self.headachesAns.text = headaches_string
            self.noseAns.text = nose_string
            self.tasteAns.text = taste_string
            self.throatAns.text = throat_string
            self.vomitAns.text = vomit_string
            self.usernameAns.text = username
            self.concernsAns.text = concerns
            
            }) { (error) in
            print(error.localizedDescription)
        }

        
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
