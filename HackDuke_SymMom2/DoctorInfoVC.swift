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
    @IBOutlet weak var dataField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitClick(_ sender: UIButton) {
        let goodEmail = email.text!.replacingOccurrences(of: ".", with: "?")
        
        ref.child(goodEmail).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
          print(snapshot)
          let value = snapshot.value as? NSDictionary
          print(value)
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
