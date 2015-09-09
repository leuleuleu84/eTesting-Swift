//
//  ExamList.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/9/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class ExamListVC: UITableViewController {

//    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(true)

        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 0) {
            self.performSegueWithIdentifier("goto_login", sender: self)
        } else {
//            self.usernameLabel.text = prefs.valueForKey("USERNAME") as? String
        }
    }
    
   
    
//    @IBAction func logOut(sender: UIButton) {
//        let appDomain = NSBundle.mainBundle().bundleIdentifier
//        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
//        
//        self.performSegueWithIdentifier("goto_login", sender: self)
//    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("examListCell", forIndexPath: indexPath) as! ExamListCell
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }

}
