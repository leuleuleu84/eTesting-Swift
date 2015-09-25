//
//  StringExtension.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/24/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

extension String {
    func toDateTime () -> NSDate? {
        var date : NSDate?
        
        let dateFomartter = NSDateFormatter()
        dateFomartter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        date = dateFomartter.dateFromString(self)
        return date
    }
    
}
