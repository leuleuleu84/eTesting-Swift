//
//  MapDtoToExamDetails.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/28/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

extension MapDtoToModel {
    
    static func toExamBrief (ExamDetailsDto: AnyObject) -> ExamBrief {
        
        let examBrief = ExamBrief()
        examBrief.examID = ExamDetailsDto["examId"] as AnyObject? as? Int ?? 0
        examBrief.examName = ExamDetailsDto["examName"] as AnyObject? as? String ?? ""
        
        let validFromString = ExamDetailsDto["startTime"] as AnyObject? as? String ?? ""
        examBrief.validFrom = validFromString.toDateTime()!
        
        examBrief.maxOfRegisters = ExamDetailsDto["maxExaminee"] as AnyObject? as? Int ?? 0
        
        
        let typeOfRegistration = ExamDetailsDto["registerType"] as AnyObject? as? Int ?? 0
        
        examBrief.typeOfRegistration = TypeOfRegistration(rawValue: typeOfRegistration)!
        
        examBrief.maxOfAttempts = ExamDetailsDto["maxAttem"] as AnyObject? as? Int ?? 0

        return examBrief
    }
}