//
//  PatientAppt.swift
//  HackDuke_SymMom2
//
//  Created by Billy Luqiu on 12/6/20.
//  Copyright © 2020 Hack Duke Keohane. All rights reserved.
//


import Foundation
import Firebase

struct PatientAppt {
  
    let ref: DatabaseReference?
    let email: String
    let date: String


    init(email:String, date:String) {
        self.ref = nil
        self.email = email
        self.date = date
        
    }

    func toAnyObject() -> Any {
      return [
        "email": email,
        "date": date
      ]
    }

}

