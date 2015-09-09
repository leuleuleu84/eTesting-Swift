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

class LoginVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var inputTextUserName: UITextField!
    @IBOutlet weak var inputTextPassWord: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInputBox(inputTextUserName)
        setupInputBox(inputTextPassWord)
        
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
    
    
    @IBAction func doLogin(sender: UIButton) {
        
        if (inputTextUserName.text!.isNullOrHaveWhiteSpace || inputTextPassWord.text!.isNullOrHaveWhiteSpace) {
            let controller = UIAlertController(title: "Lỗi",
                message: "Vui vòng đăng nhập lại thông tin",
                preferredStyle: .Alert)
            let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil)
            
            controller.addAction(action)
            
            self.presentViewController(controller, animated: true, completion: nil)
        }
        let post = String(format: "username=thang&password=hoa")
        
        print(post)
        
        let url:NSURL = NSURL(string: "http://10.15.152.56:8686/rest/v1/user/thiendd3")!
        
        let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        
        let postLength:NSString = String( postData.length)
        
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        

        var reponseError: NSError?
        var response: NSURLResponse?
        
        var urlData: NSData?
        do {
            urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
        } catch let error as NSError {
            reponseError = error
            urlData = nil
            let controller = UIAlertController(title: "Đăng nhập thất bại!",
                message: "Kết nối với server bị lỗi",
                preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            controller.addAction(action)
            
            self.presentViewController(controller, animated: true, completion: nil)
        }
        if (urlData != nil) {
            let res = response as! NSHTTPURLResponse
            
            NSLog("Response code: %ld", res.statusCode);
            if (res.statusCode >= 200 && res.statusCode < 300)
            {
                var error : NSError?
                let jsonData = (try! NSJSONSerialization.JSONObjectWithData(urlData!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
                let success = jsonData.valueForKey("success") as! Int
                print(success)
                if(success == 1)
                {
                    NSLog("Login SUCCESS");
                    
                    let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                    prefs.setObject(inputTextUserName.text!, forKey: "USERNAME")
                    prefs.setInteger(1, forKey: "ISLOGGEDIN")
                    prefs.synchronize()
                    self.dismissViewControllerAnimated(true, completion: nil)

                }
                else {
                    var error_msg:String
                    
                    if jsonData["error_message"] as? String != nil {
                        error_msg = jsonData["error_message"] as! String
                    } else {
                        error_msg = "Unknown Error"
                    }
                    
                    let controller = UIAlertController(title: "Đăng nhập thất bại!",
                        message: error_msg as String,
                        preferredStyle: .Alert)
                    let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                    
                    controller.addAction(action)
                    
                    self.presentViewController(controller, animated: true, completion: nil)
                }
                
            }
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
