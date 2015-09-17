//
//  QuestionTBV.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/11/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class QuestionsDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 4
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("questionContentCell", forIndexPath: indexPath) as! QuestionContentCell
            
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("answerOptionCell", forIndexPath: indexPath) as! AnswerOptionCell
            
            return cell
        }
        
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 100
//    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
