//
//  MapDtoToUserProfile.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/28/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

class MapDtoToModel {

    static func toUserProfile (UserProfileDto: AnyObject) -> UserProfile {
        
        var userActive = UserProfile()
        
        userActive.emailAddress = (UserProfileDto["email"] as AnyObject? as? String) ?? ""
        userActive.fullName = (UserProfileDto["name"] as AnyObject? as? String) ?? ""
        userActive.id = (UserProfileDto["userID"]as AnyObject? as? Int) ?? 0
        userActive.avartaURL = (UserProfileDto["imageUrl"] as AnyObject? as? String) ?? ""
        userActive.userName = (UserProfileDto["userName"] as AnyObject? as? String) ?? ""
        
        return userActive
    }
    
    
}
