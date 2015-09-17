//
//  Question.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/17/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

class Question {
    
    var content: String = ""
    var type: QuestionType = QuestionType.FreeText
    var media: Media = Media()
    
}

enum QuestionType {
    case SingleChoice
    case MultiChoice
    case FreeText
}