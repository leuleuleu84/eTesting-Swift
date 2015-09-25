//
//  LoginView.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/8/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit
import Alamofire

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

class LoginViewController: UIViewController, UITextFieldDelegate, UISplitViewControllerDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var inputTextUserName: UITextField!
    @IBOutlet weak var inputTextPassWord: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    var displayVC : DisplayViewController! {
        didSet {
            displayVC.user = user
            displayVC.examList = examList
        }
    }
    
    var user : UserProfile!
    var examList: [ExamBrief]!
    override func viewDidLoad() {
        
        setupInputBox(inputTextUserName)
        setupInputBox(inputTextPassWord)
        inputTextUserName.text = "thangtm7"
        inputTextPassWord.text = "dB4-mXB-k4E-JZd"
        
        let tap = UITapGestureRecognizer(target: self, action: "handleTapToEndEditing:")
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
        
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
            doLogin(buttonLogin)
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
    
    func didGetExamList (exams: [ExamBrief]) {
        self.examList = exams
        self.performSegueWithIdentifier("doLogin", sender: self)
    }
    
    func didLogin() {
        eTestingClient.getUserProfile(returnUser: loadData, doWhileLoginFail: reject)
    }
    
    func loadData (returnedUser: UserProfile) {
        self.user = returnedUser
        eTestingClient.getExamList(user, returnExamList: didGetExamList)

    }
    
    func reject() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 20, -20, 10, -10, 5, -5, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 0.4
        animation.additive = true
        inputTextPassWord.layer.addAnimation(animation, forKey: "Shake")
        inputTextUserName.layer.addAnimation(animation, forKey: "Shake")
    }
    
    
    
    @IBAction func doLogin(sender: UIButton) {
        
        let username = inputTextUserName.text
        let password = inputTextPassWord.text
        
        if (username!.isNullOrHaveWhiteSpace || password!.isNullOrHaveWhiteSpace) {
            let controller = UIAlertController(title: "Lỗi",
                message: "Vui vòng đăng nhập lại thông tin",
                preferredStyle: .Alert)
            let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil)
            
            controller.addAction(action)
            
            self.presentViewController(controller, animated: true, completion: nil)
        }
        eTestingClient.doLogin(username: username!, password: password!, doWhileLoginFail: reject, Logined: didLogin)
        

        
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
       
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "doLogin" {
            
            displayVC = segue.destinationViewController as! DisplayViewController

        }
        //         Get the new view controller using segue.destinationViewController.
        //         Pass the selected object to the new view controller.
    }

    
}