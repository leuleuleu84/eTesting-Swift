//
//  Media.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/17/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import Foundation

class Media {
    
    var id: Int = 0
    var url: String = ""
    var type: MediaType = MediaType.Video
    var maxOfTries : Int?
    var stage : MediaStage?
}

enum MediaType {
    case Image
    case Audio
    case Video
}

enum MediaStage {
    case Stopped
    case Playing
    case Paused
    case Finished
    case Buffering
}