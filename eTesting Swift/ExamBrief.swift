//
//  ExamBrief.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/17/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

class ExamBrief {
    
    var examID: Int = 0
    var examName: String = ""
    var validFrom: NSDate = NSDate()
    var validTo: NSDate?
    var maxOfRegister: Int?
    var maxOfAttempts : Int?
    var typeOfRegistration: Int = 0
}

enum TypeOfRegistration : Int {
    case Disallow = 0, UnderControl, Free
    
}

