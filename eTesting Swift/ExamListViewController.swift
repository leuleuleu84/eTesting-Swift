//
//  ExamList.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/9/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class ExamListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    @IBOutlet weak var usernameLabel: UILabel!
    
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
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("examListCell", forIndexPath: indexPath) as! ExamListCell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }

}
