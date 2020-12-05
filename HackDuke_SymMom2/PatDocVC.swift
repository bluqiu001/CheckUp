//
//  PatDocVC.swift
//  HackDuke_SymMom2
//
//  Created by David Li on 12/5/20.
//  Copyright © 2020 Hack Duke Keohane. All rights reserved.
//

import UIKit

class PatDocVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if segue.identifier == "patientSegue" {
            let loginVC = segue.destination as? LoginVC
            loginVC?.isDoctor = false
        }
        else if segue.identifier == "doctorSegue" {
            let loginVC = segue.destination as? LoginVC
            loginVC?.isDoctor = true
        }
    }
}
