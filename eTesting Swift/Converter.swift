//
//  Converter.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/25/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

class Converter {
    
    static func ConvertTypeOfRegisterToString (type: Int) -> String {
        switch type {
        case 0:
            return "Không được phép"
        case 1:
            return "Cần cấp phép"
        case 2:
            return "Đăng ký tự do"
        default:
            return "error"
        }
    }
    
}