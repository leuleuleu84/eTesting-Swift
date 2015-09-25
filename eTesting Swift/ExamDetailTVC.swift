//
//  ExamDetail.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/9/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class ExamDetailTVC: UITableViewController {

    var examDetails = ExamDetails()
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return 2
        case 1:
            return 4
        default:
            return 3
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Thông tin chung"
        case 2:
            return "Thông tin thí sinh"
        default:
            return nil
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
             
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath) as! HeaderTableViewCell
                
                headerCell.labelExamTitle.text = examDetails.examName
                headerCell.lableValidFrom.text = examDetails.validFrom.toString()
                headerCell.labelValidTo.text = examDetails.validTo?.toString()
                return headerCell
            }
//            else if indexPath.row == 1 {
            else {
                let examBriefCell = tableView.dequeueReusableCellWithIdentifier("examBriefCell", forIndexPath: indexPath) as! ExamBriefTableViewCell
                return examBriefCell
            }
        }
        else {
            let examDetailCell = tableView.dequeueReusableCellWithIdentifier("examDetailCell", forIndexPath: indexPath) as! ExamDetailTableViewCell
            return examDetailCell
        }
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                return 102
            }
            else if indexPath.row == 1 {
                return 80
            }
            else {return 0}
        default:
            return 40
        }
    }

    
}
