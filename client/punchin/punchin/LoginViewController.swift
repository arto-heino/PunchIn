//
//  LoginViewController.swift
//  punchin
//
//  Created by Carla Miettinen on 27/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    
    @IBOutlet weak var studentIdTextField: UITextField!

    @IBOutlet weak var saveLoginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastnameTextField.delegate = self
        studentIdTextField.delegate = self
        
        
        enableLoginButton(checkValidLastName() && checkValidLastName())

    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
     // Disable the Save button while editing.
     saveLoginButton.enabled = false
     }
     
     func checkValidLastName() -> Bool {
     // Disable the Save button if the text field is empty.
     let text = lastnameTextField.text ?? ""
        return !text.isEmpty
     }
    
     
     func checkValidStudentId() -> Bool {
     // Disable the Save button if the text field is empty.
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
        // Dispose of any resources that can be recreated.
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
