//
//  ExamDetails.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/16/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

class ExamDetails: ExamBrief {
    
    var description: String = ""
    var category: String = ""
    var passScore: Float = 0
    var scoreType: Int = 0
    var amountOfRegisters: Int = 0
    var certificate: String = ""
    var registedDate: NSDate?
    var registrationStatus: RegistrationStatus?
    var amountOfAttempt: Int = 0
    var lastAttempt: NSDate?
    var userTestStatus: Int?
    var duration: Int = 0

}

enum RegistrationStatus: Int {
    case Unregistered = 0, Pending, Approved
}

enum UserTestStatus : Int {
    case NotAttempt = 0, InTest, Locked, Attempted, Waiting
}