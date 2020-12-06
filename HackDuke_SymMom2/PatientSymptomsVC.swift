//
//  PatientSymptomsVC.swift
//  HackDuke_SymMom2
//
//  Created by David Li on 12/5/20.
//  Copyright © 2020 Hack Duke Keohane. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class PatientSymptomsVC: UIViewController {

    @IBOutlet weak var contact: UISegmentedControl!
    
    let ref = Database.database().reference(withPath: "patient_data")
    
    @IBOutlet weak var headaches: UISwitch!
    
    @IBOutlet weak var breath: UISwitch!
    
    @IBOutlet weak var nose: UISwitch!
    
    @IBOutlet weak var throat: UISwitch!
    
    @IBOutlet weak var coughing: UISwitch!
    
    @IBOutlet weak var aches: UISwitch!
    
    @IBOutlet weak var vomitt: UISwitch!
    
    @IBOutlet weak var taste: UISwitch!
    
    @IBOutlet weak var fever: UISwitch!
    
    
    
    @IBOutlet weak var concerns: UITextField!
    
    let user_email = Auth.auth().currentUser?.uid
    var contact_value: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //init(addedByUser: String, headaches: Bool, breath: Bool, nose: Bool, throat: Bool, cough: Bool, aches: Bool, vomit: Bool, taste: Bool, fever: Bool, concerns: String, contact: Bool) {
    
    
    @IBAction func changedConcern(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            contact_value = true
        case 1:
            contact_value = false
        default:
            break
        }
    }
    
    @IBAction func submission(_ sender: Any) {
        
        let curPatientData = PatientData(addedByUser: user_email!, headaches: headaches.isOn, breath: breath.isOn, nose: nose.isOn, throat: throat.isOn, cough: coughing.isOn, aches: aches.isOn, vomit: vomitt.isOn, taste: taste.isOn, fever: fever.isOn, concerns: concerns.text!, contact: contact_value)
        print(user_email!)
        let ref = self.ref.child(user_email!)
        ref.setValue(curPatientData.toAnyObject())
        
        
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
