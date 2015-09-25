//
//  NSDateToString.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/24/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation
extension NSDate {
    func toString () -> String? {
        var result: String?
        let dateFomartter = NSDateFormatter()
        dateFomartter.dateFormat = "yyyy-MM-dd"
        result = dateFomartter.stringFromDate(self)
        return result
    }
    
}