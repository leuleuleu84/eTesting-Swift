//
//  ConvertExamDetailsToDataSource.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/29/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation
extension Converter {
    
    static func toDataSource (fromExam exam: ExamDetails) -> [[[String]]] {
        var dataSource = [[[String]]]()
        var headerSection = [[String]]()
        var generalInformationSection = [[String]]()
        var examineeInformationSection = [[String]]()
        
        
        
        var stringHeader = [String]()
        
        stringHeader.append(exam.examName.uppercaseString)
        stringHeader.append(exam.validFrom.toString())
        
        if let validTo = exam.validTo {
            stringHeader.append(validTo.toString())
        } else {
            stringHeader.append("Không xác định")
        }
        
        headerSection.append(stringHeader)

        
        
        // Mark: description
        var description = [String]()
        description.append(exam.description)
        headerSection.append(description)

        dataSource.append(headerSection)
        //Mark: Thông tin chung
        
        var categoryCell = [String]()
        categoryCell.append("Danh mục")
        categoryCell.append(exam.category)
        generalInformationSection.append(categoryCell)
        
        var typeOfRegistrationCell = [String]()
        typeOfRegistrationCell.append("Hình thức đăng ký")
        typeOfRegistrationCell.append(convertTypeOfRegisterToString(exam.typeOfRegistration))
        generalInformationSection.append(typeOfRegistrationCell)
        
        var passCoreCell = [String]()
        passCoreCell.append("Điểm đạt")
        passCoreCell.append("\(exam.passScore)")
        generalInformationSection.append(passCoreCell)
        
        var scoreTypeCell = [String]()
        scoreTypeCell.append("Cách lấy điểm")
        scoreTypeCell.append(convertScoreTypeToString(exam.scoreType))
        generalInformationSection.append(scoreTypeCell)
        
        var durationCell = [String]()
        durationCell.append("Thời gian thi")
        durationCell.append("\(exam.duration / 60) phút" )
        generalInformationSection.append(durationCell)
        
        var maxOfAttemptsCell = [String]()
        maxOfAttemptsCell.append("Số lần thi tối đa")
        maxOfAttemptsCell.append("\(exam.maxOfAttempts)")
        generalInformationSection.append(maxOfAttemptsCell)
        
        var maxOfRegistersCell = [String]()
        maxOfRegistersCell.append("Số thí sinh")
        maxOfRegistersCell.append("\(exam.maxOfRegisters)")
        generalInformationSection.append(maxOfRegistersCell)
        
        var certificateCell = [String]()
        certificateCell.append("Chứng chỉ")
        certificateCell.append(exam.certificate)
        generalInformationSection.append(certificateCell)
        
        
        dataSource.append(generalInformationSection)
        
        if exam.registrationStatus == RegistrationStatus.Approved {
            var registeredDateCell = [String]()
            registeredDateCell.append("Ngày đăng ký")
            registeredDateCell.append(exam.registedDate!.toString())
            examineeInformationSection.append(registeredDateCell)
            
            if exam.amountOfAttempt == 0 {
                var amountOfAttemptCell = [String]()
                amountOfAttemptCell.append("Số lần đã thi")
                amountOfAttemptCell.append("Chưa thi")
                examineeInformationSection.append(amountOfAttemptCell)
                
            }
            else {
                var amountOfAttemptCell = [String]()
                amountOfAttemptCell.append("Số lần đã thi")
                amountOfAttemptCell.append("\(exam.amountOfAttempt)")
                examineeInformationSection.append(amountOfAttemptCell)
                
                
                var lastAttemptCell = [String]()
                lastAttemptCell.append("Lần thi cuối cùng")
                lastAttemptCell.append("\(exam.lastAttempt!.toString())")
                examineeInformationSection.append(lastAttemptCell)
                
                var lastAttemptStatusCell = [String]()
                lastAttemptStatusCell.append("Trạng thái bài thi")
                lastAttemptStatusCell.append(convertLastAttemptStatusToString(exam.userTestStatus))
                examineeInformationSection.append(lastAttemptStatusCell)
            }
            dataSource.append(examineeInformationSection)
        }
        return dataSource
        
    }
    
}