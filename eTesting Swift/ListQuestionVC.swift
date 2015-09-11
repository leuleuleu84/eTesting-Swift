//
//  ListQuestionVC.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/10/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class ListQuestionVC: UIViewController, UIPopoverPresentationControllerDelegate {
    
    
    var menuViewController: MenuVC!
    var listQuestion = [QuestionTBV]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func turnOnPopup(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("popoverView", sender: self)
    }
    
    @IBAction func finishAction(sender: UIBarButtonItem) {
        performSegueWithIdentifier("gotoResult", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popoverView"{
            
        
        let collectionViewController = segue.destinationViewController as! MenuVC
            collectionViewController.preferredContentSize = CGSizeMake(300,200)

        let popoverController = collectionViewController.popoverPresentationController

        if let controller = popoverController {
        

            controller.delegate = self
            
        }
        }
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
