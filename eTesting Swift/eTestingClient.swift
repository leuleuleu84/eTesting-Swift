//
//  eTestingClient.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/16/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation
import Alamofire 

class eTestingClient {
    
    static func  getUserProfile (username: String, password: String) -> UserProfile {
        var user = UserProfile()
        let credentialData = "\(username):\(password)".dataUsingEncoding(NSASCIIStringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions( NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        Alamofire.request(.POST, "http://10.15.152.56:8686/rest/v1/user/thiendd3/", headers: headers)
            .responseJSON { _, _, resultRequest in
                
                if let data = resultRequest.value!["data"]! {
                    user.emailAddress = (data["email"] as AnyObject? as? String) ?? ""
                    user.fullName = (data["name"] as AnyObject? as? String) ?? ""
                    user.id = (data["userID"]as AnyObject? as? Int) ?? 0
                    user.avartaURL = (data["imageUrl"] as AnyObject? as? String) ?? ""
                    user.userName = (data["userName"] as AnyObject? as? String) ?? ""
                }
                
        }


        return user
    }
    

    
}
