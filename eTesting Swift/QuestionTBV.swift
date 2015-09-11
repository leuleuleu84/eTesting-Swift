//
//  QuestionTBV.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/11/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class QuestionTBV: UITableView, UITableViewDelegate, UITableViewDataSource {

    
    override func numberOfRowsInSection(section: Int) -> Int {
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
        let cell = tableView.dequeueReusableCellWithIdentifier("questionContentCell", forIndexPath: indexPath) as! QuestionContentCell

        return cell
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
