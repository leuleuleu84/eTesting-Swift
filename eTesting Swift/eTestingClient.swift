
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
                        userActive = MapDtoToModel.toUserProfile(data)
                    }
                    returnUser(user: userActive)
                }
                else {
                    doWhileLoginFail()
                }
        }
    }
    
    
}
