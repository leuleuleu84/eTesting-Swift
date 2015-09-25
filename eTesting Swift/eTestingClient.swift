
//  eTestingClient.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/16/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation
import Alamofire

protocol loadDataDelegate {
    func didFinishLoadUserProfile()
}


class eTestingClient {
    
    static var delegate = loadDataDelegate?()
    
    static var headers = [String: String]()
    
    static var userName = "" {
        didSet {
            if userName != "" && password != "" {
                headers = getHeaders(username: userName, password: password)
            }
        }
    }
    
    
    static var password :String = ""{
        didSet{
            if userName != "" && password != "" {
                headers = getHeaders(username: userName, password: password)
            }
        }
    }
    static var userActive = UserProfile()
    
    static func getHeaders (username username: String, password: String) -> [String: String] {
        
        let credentialData = "\(username):\(password)".dataUsingEncoding(NSASCIIStringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions( NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        
        
        return ["Authorization": "Basic \(base64Credentials)"]
    }
    
    static func doLogin (username username: String, password: String, doWhileLoginFail: ()-> (), Logined: () -> ())  {
        self.userName = username
        self.password = password
        
        let urlString = "http://10.15.152.56:8686/rest/v1/User/Login/"
        
        let body : [String:String] = [
            "username":username,
            "pass": password
        ]
        
        Alamofire.request(.POST, urlString, parameters: body)
            .responseJSON { _, _, resultRequest in
                if resultRequest.isSuccess {
                    Logined()
                }
                else {
                    doWhileLoginFail()
                }
        }
        
    }
    
    static func  getUserProfile (returnUser returnUser: (user: UserProfile)->(), doWhileLoginFail: ()-> ()) {
        
        let urlString = "http://10.15.152.56:8686/rest/v1/user/\(self.userName)/"
        Alamofire.request(.POST, urlString, headers: headers)
            .responseJSON { _, _, resultRequest in
                if resultRequest.isSuccess {
                    if let data = resultRequest.value!["data"]! {
                        
                        userActive.emailAddress = (data["email"] as AnyObject? as? String) ?? ""
                        userActive.fullName = (data["name"] as AnyObject? as? String) ?? ""
                        userActive.id = (data["userID"]as AnyObject? as? Int) ?? 0
                        userActive.avartaURL = (data["imageUrl"] as AnyObject? as? String) ?? ""
                        userActive.userName = (data["userName"] as AnyObject? as? String) ?? ""
                    }
                    returnUser(user: userActive)
                }
                else {
                    doWhileLoginFail()
                }
        }
    }
    
    static func getExamList ( userActive: UserProfile, currentPage: Int = 0, returnExamList : (examList: [ExamBrief])->()){
        
        var exams = [ExamBrief]()
        let pageSize = 10
        let urlString = "http://10.15.152.56:8686/rest/v1/Exam?UserId=\(userActive.id)&Type=0&keyword&StartAt=\(currentPage)&PageSize=\(pageSize)"
        
        Alamofire.request(.GET, urlString, headers: headers )
            .responseJSON { (_, _, returnedResult) -> Void in
                if returnedResult.isSuccess {
                    if let data = returnedResult.value!["records"]! as! [AnyObject]?{
                        for item in data {
                            let exam = ExamBrief()
                            exam.examID = item["examId"] as AnyObject? as? Int ?? 0
                            exam.examName = item["examName"] as AnyObject? as? String ?? ""
                            
                            let validFromString = item["startTime"] as AnyObject? as? String ?? ""
                            exam.validFrom = validFromString.toDateTime()!
                            
                            exam.maxOfRegister = item["maxExaminee"] as AnyObject? as? Int ?? 0
                            
                            exam.typeOfRegistration = item["registerType"] as AnyObject? as? Int ?? 0
                            
                            exam.maxOfAttempts = item["maxAttem"] as AnyObject? as? Int ?? 0
                            
                            exams.append(exam)
                        }
                        returnExamList(examList: exams)
                        
                    }
                }
        }
    }
    
    static func getExamDetail(examBrief:ExamBrief, returnExam: (returnExamDetailTo: ExamDetails)->()) {
        
        let id = examBrief.examID
        let examDetails = ExamDetails()
        let urlString = "http://10.15.152.56:8686/rest/v1/Exam/\(id)/user/\(userActive.id)/"
        Alamofire.request(.GET, urlString, headers: headers).responseJSON { (_, _, returnedResult) -> Void in
            if returnedResult.isSuccess {

                if let data = returnedResult.value!["data"]! {
                    examDetails.description = data["description"] as AnyObject? as? String ?? ""
                    examDetails.category = data ["category"] as AnyObject? as? String ?? ""
                    examDetails.certificate = data["certificate"] as AnyObject? as? String ?? ""
                    examDetails.duration = data["durationInSecond"] as AnyObject? as? Int ?? 0
                    let validTo = data["endTime"] as AnyObject? as? String ?? ""
                    examDetails.validTo = validTo.toDateTime()
                    examDetails.examID = data["endTime"] as AnyObject? as? Int ?? 0
                    examDetails.examName = data["examName"] as AnyObject? as? String ?? ""
                    examDetails.maxOfAttempts = data["maxAttem"] as AnyObject? as? Int ?? 0
                    examDetails.maxOfRegister = data["maxExaminee"] as AnyObject? as? Int ?? 0
                    examDetails.passScore = data["passScore"] as AnyObject? as? Float ?? 0.0
                    examDetails.typeOfRegistration = data["registerType"] as AnyObject? as? Int ?? 0
                    
                }

                returnExam(returnExamDetailTo: examDetails)
                
            }
        }
    }
}
