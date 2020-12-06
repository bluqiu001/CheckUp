
//
//  PatientData.swift
//  HackDuke_SymMom2
//
//  Created by Billy Luqiu on 12/6/20.
//  Copyright © 2020 Hack Duke Keohane. All rights reserved.
//

import Foundation
import Firebase

struct PatientData {
  
    let ref: DatabaseReference?
    let addedByUser: String
    var headaches: Bool
    var breath: Bool
    var nose: Bool
    var throat: Bool
    var cough: Bool
    var aches: Bool
    var vomit: Bool
    var taste: Bool
    var fever: Bool
    let concerns: String
    var contact: Bool


    init(addedByUser: String, headaches: Bool, breath: Bool, nose: Bool, throat: Bool, cough: Bool, aches: Bool, vomit: Bool, taste: Bool, fever: Bool, concerns: String, contact: Bool) {
        self.ref = nil
        self.addedByUser = addedByUser
        self.headaches = headaches
        self.breath = breath
        self.nose = nose
        self.throat = throat
        self.cough = cough
        self.aches = aches
        self.vomit = vomit
        self.taste = taste
        self.fever = fever
        self.concerns = concerns
        self.contact = contact
        
    }

    func toAnyObject() -> Any {
      return [
        "addedByUser": addedByUser,
        "headaches" : headaches,
        "breath": breath,
        "nose": nose,
        "throat": throat,
        "cough": cough,
        "aches": aches,
        "vomit": vomit,
        "taste": taste,
        "fever": fever,
        "concerns": concerns,
        "contact": contact
      ]
    }

}
