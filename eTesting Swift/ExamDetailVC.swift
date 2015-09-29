//
//  ExamDetail.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/9/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class ExamDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var examDetails : ExamDetails! {
        didSet{
            dataSource = Converter.toDataSource(fromExam: examDetails)
            buttonActionTitle = Converter.toButtonActionTitle(fromExam: examDetails)
        }
    }
    
    var dataSource = [[[String]]]()
    
    var buttonActionTitle = String()

    var descriptionCellHeight :CGFloat = 0
    
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var buttonAction: UIButton!
    
    override func viewDidLoad() {
        mainTable.dataSource = self
        mainTable.delegate = self
        buttonAction.setTitle(buttonActionTitle, forState: UIControlState.Normal)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Thông tin chung"
        case 2:
            return "Thông tin thí sinh"
        default:
            return nil
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
             
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath) as! HeaderTableViewCell
                
                headerCell.labelExamTitle.text = dataSource[indexPath.section][indexPath.row][0]
                headerCell.lableValidFrom.text = dataSource[indexPath.section][indexPath.row][1]
                headerCell.labelValidTo.text = dataSource[indexPath.section][indexPath.row][2]
                return headerCell
            }
            else {
                let examBriefCell = tableView.dequeueReusableCellWithIdentifier("examBriefCell", forIndexPath: indexPath) as! ExamDescriptionTableViewCell
                examBriefCell.examDescription.loadHTMLString(dataSource[indexPath.section][indexPath.row][0], baseURL: nil)
                
                if (descriptionCellHeight != calculateDescriptionHeight(examBriefCell)){
                    descriptionCellHeight = calculateDescriptionHeight(examBriefCell)
//                    tableView.reloadData()
                }
                
                return examBriefCell

            }
        }
        else {
            let examDetailCell = tableView.dequeueReusableCellWithIdentifier("examDetailCell", forIndexPath: indexPath) as! ExamDetailTableViewCell
            
            examDetailCell.labelContent.text = dataSource[indexPath.section][indexPath.row][0]
            examDetailCell.labelValue.text = dataSource[indexPath.section][indexPath.row][1]
            return examDetailCell
        }
    }
    
    func calculateDescriptionHeight (cell: ExamDescriptionTableViewCell ) -> CGFloat {
        
        let webView = cell.examDescription.scrollView
        let height = webView.contentSize.height
        return height
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 110
            }
            else if indexPath.row == 1 {
                return descriptionCellHeight
            }
            else {return 0}
        } else {
            return 40
        }
        
    }

    @IBAction func handleButtonAction(sender: UIButton) {
        
    }
    
}
