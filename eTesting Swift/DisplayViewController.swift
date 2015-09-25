//
//  DisplayViewController.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/22/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController, UISplitViewControllerDelegate {
    
    var user = UserProfile()
    var examList = [ExamBrief]()
    var splitVC: UISplitViewController!
    var collapseSecondaryViewController: ExamListViewController!
    var primaryViewController: SideBarTableViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitVC = self.childViewControllers[0] as! UISplitViewController

        var nav = splitVC.viewControllers as! [UINavigationController]
        primaryViewController = nav[0].topViewController as! SideBarTableViewController

        primaryViewController.user = user

        collapseSecondaryViewController = nav[1].topViewController as! ExamListViewController

        collapseSecondaryViewController.examList = examList
        
        performTraitCollectionOverrideForSize(view.bounds.size)
        configureSplitVC()        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func performTraitCollectionOverrideForSize(size: CGSize) {
        var overrideTraitCollection: UITraitCollection? = nil
            overrideTraitCollection = UITraitCollection(horizontalSizeClass: .Regular)
        for vc in self.childViewControllers {
            setOverrideTraitCollection(overrideTraitCollection, forChildViewController: vc)
        }
    }

    private func configureSplitVC() {
        // Set up split view delegate
        let splitVC = self.childViewControllers[0] as! UISplitViewController
        splitVC.delegate = self
        splitVC.preferredPrimaryColumnWidthFraction = 0.8
        let navVC = splitVC.childViewControllers.last as! UINavigationController
        navVC.topViewController!.navigationItem.leftBarButtonItem = splitVC.displayModeButtonItem()
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
