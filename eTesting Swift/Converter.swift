//
//  Converter.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/25/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

class Converter {
    
    static func convertTypeOfRegisterToString (type: TypeOfRegistration) -> String {
        switch type {
        case TypeOfRegistration.Disallow:
            return "Không được phép"
        case TypeOfRegistration.UnderControl:
            return "Cần cấp phép"
        case TypeOfRegistration.Free:
            return "Đăng ký tự do"
        }
    }
    
    static func convertScoreTypeToString(type: Int) -> String {
        switch type {
        case 0:
            return "Điểm trung bình"
        case 1:
            return "Điểm cao nhất"
        case 2:
            return "Điểm cuối cùng"
        default:
            return "error"
        }
    }
    
    static func convertLastAttemptStatusToString(status: UserTestStatus) -> String {
        switch status {
        case UserTestStatus.Attempted:
            return "Đã hoàn thành"
        case UserTestStatus.Waiting:
            return "Đang chấm"
        case UserTestStatus.Locked:
            return "Đã có điểm"
        default:
            return "Unknown"
        }
    }
    
    static func toButtonActionTitle (fromExam exam: ExamDetails) -> String {
        
        switch exam.registrationStatus {
        case RegistrationStatus.Unregistered:
            return "Đăng ký thi"
        case RegistrationStatus.Pending:
            return "Chờ phê duyệt"
        case RegistrationStatus.Approved:
            
            switch exam.userTestStatus {
            case UserTestStatus.InTest:
                return "Đang thi"
            case UserTestStatus.NotAttempt:
                return "Bắt đầu thi"
            case UserTestStatus.Attempted:
                if exam.amountOfAttempt > 0 && exam.amountOfAttempt == exam.maxOfAttempts - 1 {
                    return "Lock (Vượt quá số lần thi)"
                }
                else {
                    return "Băt đầu lần thi tiếp theo"
                }
                
            default:
                return "error"
            }
//        default:
//            return "error"
        }

    }
    
    
   
    
}