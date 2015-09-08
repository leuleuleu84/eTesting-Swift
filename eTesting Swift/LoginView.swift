//
//  LoginView.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/8/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var inputTextUserName: UITextField!
    @IBOutlet weak var inputTextPassWord: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       setupInputBox(inputTextUserName)
       setupInputBox(inputTextPassWord)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupInputBox(tf: UITextField){
        tf.layer.borderColor = UIColor.whiteColor().CGColor
        tf.layer.borderWidth = 1
        tf.layer.masksToBounds = true
        tf.layer.cornerRadius = tf.bounds.height / 2;
        
        tf.attributedPlaceholder = NSAttributedString(string:tf.placeholder!,
            attributes:[NSForegroundColorAttributeName:UIColor.whiteColor().colorWithAlphaComponent(0.5)])
        
        tf.textColor = UIColor.whiteColor()
        
        tf.font = UIFont.systemFontOfSize(17);
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
