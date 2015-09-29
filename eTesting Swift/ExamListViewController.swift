//
//  ExamList.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/9/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class ExamListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var examList = [ExamBrief]()
    var examDetails = ExamDetails()
    
    var examDetailsVC : ExamDetailVC! {
        didSet {
            examDetailsVC.examDetails = examDetails
        }
    }
    
    @IBOutlet weak var listExams: UITableView!
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(true)
        listExams.dataSource = self
        listExams.delegate = self
        self.edgesForExtendedLayout = UIRectEdge.None

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("examListCell", forIndexPath: indexPath) as! ExamListCell
        cell.examTitle.text = examList[indexPath.row].examName
        cell.labelValidFrom.text = examList[indexPath.row].validFrom.toString()
        cell.labelValidTo.text = examList[indexPath.row].validTo?.toString()
        cell.labelAmountOfRegister.text = "\(examList[indexPath.row].maxOfRegisters)"
        cell.labelRegisterType.text = Converter.convertTypeOfRegisterToString(examList[indexPath.row].typeOfRegistration)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let exam = examList[indexPath.row]
        eTestingClient.getExamDetail(exam, returnExam: gotExamDetails)
        

    }
    
    func gotExamDetails(examDetails : ExamDetails) {
        self.examDetails = examDetails
        self.performSegueWithIdentifier("showExamDetails", sender: self)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showExamDetails" {
            let nav = segue.destinationViewController as! UINavigationController
            examDetailsVC = nav.topViewController as! ExamDetailVC
//            
            nav.navigationItem.leftItemsSupplementBackButton = true
//            nav.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: nil)

        }
    }
    

}
