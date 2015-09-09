//
//  LoginView.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/8/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

extension String {

    var isNullOrHaveWhiteSpace : Bool {
        if (self.isEmpty){
            return true
        }

        else if (self.rangeOfCharacterFromSet(NSCharacterSet(charactersInString: " ")) != nil) {
            return true
        }
        return false
    }
}

class LoginView: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var inputTextUserName: UITextField!
    @IBOutlet weak var inputTextPassWord: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInputBox(inputTextUserName)
        setupInputBox(inputTextPassWord)
        
        
        buttonLogin.addTarget(self, action: "doLogin", forControlEvents: UIControlEvents.TouchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: "handleTapToEndEditing:")
        view.addGestureRecognizer(tap)
    }

    func handleTapToEndEditing (tap: UITapGestureRecognizer){
        view.endEditing(true)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == inputTextUserName) {
//            inputTextUserName.resignFirstResponder()
            inputTextPassWord.isFirstResponder()
        }
        else if (textField == inputTextPassWord){
            inputTextPassWord.resignFirstResponder()
            doLogin()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        scrollView.contentOffset = CGPoint(x: 0, y: 150)
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupInputBox(tf: UITextField){
        tf.delegate = self
        tf.layer.borderColor = UIColor.whiteColor().CGColor
        tf.layer.borderWidth = 1
        tf.layer.masksToBounds = true
        tf.layer.cornerRadius = tf.bounds.height / 2;
        
        tf.attributedPlaceholder = NSAttributedString(string:tf.placeholder!,
            attributes:[NSForegroundColorAttributeName:UIColor.whiteColor().colorWithAlphaComponent(0.5)])
        
        tf.textColor = UIColor.whiteColor()
        
        tf.font = UIFont.systemFontOfSize(17);
    }
    
    func doLogin () {
        if (inputTextUserName.text!.isNullOrHaveWhiteSpace || inputTextPassWord.text!.isNullOrHaveWhiteSpace) {
            let controller = UIAlertController(title: "Lỗi",
                message: "Vui vòng đăng nhập lại thông tin",
                preferredStyle: .Alert)
            let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil)
        
            controller.addAction(action)
        
            self.presentViewController(controller, animated: true, completion: nil)
        }
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
