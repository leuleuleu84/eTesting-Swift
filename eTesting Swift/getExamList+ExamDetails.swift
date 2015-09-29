//
//  getExamList.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/29/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation
import Alamofire

extension eTestingClient {
    
    static func getExamList ( userActive: UserProfile, currentPage: Int = 0, returnExamList : (examList: [ExamBrief])->()){
        
        var exams = [ExamBrief]()
        let pageSize = 10
        let urlString = "http://10.15.152.56:8686/rest/v1/Exam?UserId=\(userActive.id)&Type=0&keyword&StartAt=\(currentPage)&PageSize=\(pageSize)"
        
        Alamofire.request(.GET, urlString, headers: headers )
            .responseJSON { (_, _, returnedResult) -> Void in
                if returnedResult.isSuccess {
                    if let data = returnedResult.value!["records"]! as! [AnyObject]?{
                        for item in data {
                            exams.append(MapDtoToModel.toExamBrief(item))
                        }
                        returnExamList(examList: exams)
                        
                    }
                }
        }
    }

    static func getExamDetail(examBrief:ExamBrief, returnExam: (returnExamDetailTo: ExamDetails)->()) {
        
        let id = examBrief.examID
        var examDetails = ExamDetails()
        
        let urlString = "http://10.15.152.56:8686/rest/v1/Exam/\(id)/user/\(userActive.id)/"
        Alamofire.request(.GET, urlString, headers: headers).responseJSON { (_, _, returnedResult) -> Void in
            if returnedResult.isSuccess {
                
                if let data = returnedResult.value!["data"]! {
                    print(data)
                    examDetails = MapDtoToModel.toExamDetails(data)
                }
                
                returnExam(returnExamDetailTo: examDetails)
                
            }
        }
    }


    
}