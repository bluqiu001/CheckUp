//
//  DoctorScheduleVC.swift
//  HackDuke_SymMom2
//
//  Created by David Li on 12/6/20.
//  Copyright © 2020 Hack Duke Keohane. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


class DoctorScheduleVC: UIViewController {

    @IBOutlet weak var patientEmail: UITextField!
    @IBOutlet weak var date2: UIDatePicker!
    
    let ref = Database.database().reference(withPath: "patient_appt")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submission(_ sender: Any) {
        let date  = self.date2.date
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short

        let curAppt = PatientAppt(email: patientEmail.text!, date: formatter1.string(from: date))
        let goodEmail = patientEmail.text!.replacingOccurrences(of: ".", with: "?")
        

        let ref = self.ref.child(goodEmail)
        ref.setValue(curAppt.toAnyObject())
    }
    //    @IBAction func submission(_ sender: Any) {
//
//    }

}
