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
    var courseId: Int = 0
    var lessonsId: Int = 0
    
    
    //buttons

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func login(sender: UIButton) {
        let studentId:Int? = Int(studentIdTextField.text!)
        post.setStudentNumber(studentId!)
        post.setSurname(lastnameTextField.text!)
        print("posted")
        post.httpPost()
        saveUserData()
        
        /*let message = post.message
        print(message)
        let alertController = UIAlertController(title: "iOScreator", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)*/
        

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
    
    func setCourse(crsId: Int) {
        courseId = crsId
        print("course id:", courseId)
    }
    
    func setLesson(lsId: Int) {
        lessonsId = lsId
        print("lesson id:", lessonsId)
    }
    
    
    
    
    //SAVING THE USER DATA
    
    
    
    func saveUserData() {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    defaults.setObject(lastnameTextField.text, forKey: "lastname")
    defaults.setObject(studentIdTextField.text, forKey: "studentId")
    defaults.synchronize()
    
    }
    

}
