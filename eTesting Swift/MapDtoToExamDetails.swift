//
//  MapDtoToExamDetails.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/28/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

extension MapDtoToModel {
    
    static func toExamDetails (examDetailsDto: AnyObject) -> ExamDetails{
    
        let examDetails = ExamDetails()
        examDetails.description = examDetailsDto["description"] as AnyObject? as? String ?? ""
        examDetails.category = examDetailsDto ["category"] as AnyObject? as? String ?? ""
        examDetails.certificate = examDetailsDto["certificate"] as AnyObject? as? String ?? ""
        examDetails.duration = examDetailsDto["durationInSecond"] as AnyObject? as? Int ?? 0

        let validTo = examDetailsDto["endTime"] as AnyObject? as? String ?? ""
        examDetails.validTo = validTo.toDateTime()
        
        examDetails.examID = examDetailsDto["endTime"] as AnyObject? as? Int ?? 0
        examDetails.examName = examDetailsDto["examName"] as AnyObject? as? String ?? ""
        examDetails.maxOfAttempts = examDetailsDto["maxAttem"] as AnyObject? as? Int ?? 0
        examDetails.maxOfRegisters = examDetailsDto["maxExaminee"] as AnyObject? as? Int ?? 0
        examDetails.passScore = examDetailsDto["passScore"] as AnyObject? as? Float ?? 0.0
        
        let typeofRegistration = examDetailsDto["registerType"] as AnyObject? as? Int ?? 0
        examDetails.typeOfRegistration = TypeOfRegistration(rawValue: typeofRegistration)!
        
        
        let status = examDetailsDto["registrationStatus"] as AnyObject? as? Int ?? 0
    
        examDetails.registrationStatus = RegistrationStatus(rawValue: status)!
        
//        let userTestStatus = examDetailsDto["registrationStatus"] as AnyObject? as? Int ?? 0
        
//        examDetails.userTestStatus
        return examDetails
    }
    
}