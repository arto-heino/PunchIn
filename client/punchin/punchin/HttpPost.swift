//
//  HttpPost.swift
//  punchin
//
//  Created by Milos Berka on 27.4.2016.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation
import Alamofire

class HttpPost {
    
    var courseId: Int
    var lessonsId: Int
    var s_name: String
    var studentNumber: Int
    var message: String
    var alertMessage: String
    var viewController: LoginViewController!
    var error: Bool
    var done: Bool
    
    let savedIds = NSUserDefaults.standardUserDefaults()
    
    init () {
        self.courseId = 0
        self.lessonsId = 0
        self.s_name = ""
        self.studentNumber = 0
        self.message = ""
        self.alertMessage = ""
        self.error = true
        self.done = false
    }
    
    
    func setSurname (surname: String) {
        s_name = surname
    }
    
    func setStudentNumber (stNumber: Int) {
        studentNumber = stNumber
    }
    
    func setCourse() {
        if (savedIds.valueForKey("courseid") != nil) {
            courseId = savedIds.valueForKey("courseid") as! NSInteger as Int
            print(courseId)
        }
    }
    
    func setLesson() {
        if (savedIds.valueForKey("lessonid") != nil) {
            lessonsId = savedIds.valueForKey("lessonid") as! NSInteger as Int
            print(lessonsId)
        }
    }
    
    func setMessage(statusMessage: String) {
        self.alertMessage = statusMessage
    }
    
    func setStatus(status: Bool) {
        self.done = status
    }
    
    func setError(error: Bool) {
        self.error = error
    }
    
    func getMessage() -> String {
        return self.alertMessage
    }
    
    func getStatus() -> Bool {
        return self.done
    }
    
    func getError() -> Bool {
        return self.error
    }
    
    
    func httpPost () {
        self.error = true
        
        let parameters = [
            "course_id": courseId,
            "lessons_id": lessonsId,
            "s_name": s_name,
            "student_number": studentNumber
        ]
        
        Alamofire.request(.POST, "http://82.196.15.60:8081/attend/", parameters: parameters as! [String : AnyObject])
            .responseJSON{response in
                    if let httpStatusCode = response.response?.statusCode {
                        print(httpStatusCode)
                        switch(httpStatusCode) {
                        case 200:
                            self.error = false
                            self.message = ""
                            break
                        case 401:
                            self.message = "Wrong username or ID."
                            break
                        case 402:
                            self.message = "You do not belong to this course."
                            break
                        case 403:
                            self.message = "You are already punched into this course."
                            self.error = false
                            break
                        case 500:
                            self.message = "Status 500: Internal Server Error."
                            break
                        default:
                            self.message = "Oops! Something went wrong. Try again later."
                            break
                        }
                    } else {
                        //message = error.localizedDescription
                    }
                    self.setMessage(self.message)
                    self.setError(self.error)
                    self.viewController.shouldPerformSegueWithIdentifier("SignIn", sender: self)
                }

          }
}
