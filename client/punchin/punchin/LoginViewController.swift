//
//  LoginViewController.swift
//  punchin
//
//  Created by Carla Miettinen on 27/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    let post = HttpPost()
    var message = "default msg"
    var courseId: Int = 0
    var lessonsId: Int = 0
    var doneWithPost: Bool = false
    var firstCall: Bool = true
    
    
    //buttons

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func login(sender: UIButton) {
        let studentId:Int? = Int(studentIdTextField.text!)
        self.firstCall = true
        post.setStudentNumber(studentId!)
        post.setSurname(lastnameTextField.text!)
        post.setCourse()
        post.setLesson()
        post.httpPost()
        saveUserData()
    }
    
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBOutlet weak var studentIdTextField: UITextField!

    @IBOutlet weak var saveLoginButton: UIButton!
    
    
    
    //checks in login 
    
    var lastname = ""
    var studentId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastnameTextField.delegate = self
        studentIdTextField.delegate = self
        
        let logoImage = UIImageView(frame: CGRect(x:0, y:0, width: 200, height: 45))
        logoImage.contentMode = .ScaleAspectFit
        
        let logo = UIImage(named: "Image")
        logoImage.image = logo
        self.navigationItem.titleView = logoImage
        
        let loginDefaults = NSUserDefaults.standardUserDefaults()
        
        if (loginDefaults.valueForKey("lastname") != nil) {
            lastname = loginDefaults.valueForKey("lastname") as! NSString as String
            lastnameTextField.text = NSString(format: lastname) as String
        }
        
        if (loginDefaults.valueForKey("studentId") != nil) {
            studentId = loginDefaults.valueForKey("studentId") as! NSString as String
            studentIdTextField.text = NSString(format: studentId) as String
        }
        
        enableLoginButton(checkValidLastName() && checkValidStudentId())
        
        post.viewController = self

    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
     saveLoginButton.enabled = false
    }
    
     func checkValidLastName() -> Bool {
     let text = lastnameTextField.text ?? ""
        return !text.isEmpty
     }
    
     
     func checkValidStudentId() -> Bool {
     let text = studentIdTextField.text ?? ""
        return !text.isEmpty
     }
    
    func enableLoginButton(enable: Bool) {
        saveLoginButton.enabled = enable
        
    }
     
     func textFieldDidEndEditing(textField: UITextField) {
        enableLoginButton(checkValidLastName() && checkValidStudentId())
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "SignIn" {
            if (firstCall == true){
                firstCall = false
                return false
            }
            
            if (firstCall == false && post.error == true) {
                message = post.message
                let alertView = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
                alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                self.presentViewController(alertView, animated: true, completion: nil)
                
                return false
            }
                
            else {
                performSegueWithIdentifier(identifier, sender: self)
                return true
            }
        }
        
        // by default, transition
        return true
    }
    
    func setCourse(crsId: Int) {
        courseId = crsId
        print("course id:", courseId)
    }
    
    func setLesson(lsId: Int) {
        lessonsId = lsId
        print("lesson id:", lessonsId)
    }
    
    func presentAlert() {
        let alertView = UIAlertController(title: "AlertView title here", message: message, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    
    
    
    //SAVING THE USER DATA
    
    
    
    func saveUserData() {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    defaults.setObject(lastnameTextField.text, forKey: "lastname")
    defaults.setObject(studentIdTextField.text, forKey: "studentId")
    defaults.synchronize()
    
    }
    

}
