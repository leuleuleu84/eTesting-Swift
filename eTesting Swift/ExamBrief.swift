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
    var maxOfRegisters: Int = 0
    var maxOfAttempts : Int = 0
    var typeOfRegistration: TypeOfRegistration = TypeOfRegistration.Disallow
    
    
}
enum TypeOfRegistration : Int {
    case Disallow = 0, UnderControl, Free
}



