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
    var message : String
    
    init () {
        self.courseId = 0
        self.lessonsId = 0
        self.s_name = ""
        self.studentNumber = 0
        self.message = ""
    }
    
    let savedIds = NSUserDefaults.standardUserDefaults()
    
    func setSurname (surname: String) {
        s_name = surname
    }
    
    func setStudentNumber (stNumber: Int) {
        studentNumber = stNumber
    }
    
    func setCourse() {
        
        if (savedIds.valueForKey("courseid") != nil) {
            courseId = savedIds.valueForKey("courseid") as! NSInteger as Int
        }
    }
    
    func setLesson() {
        
        if (savedIds.valueForKey("lessonid") != nil) {
            lessonsId = savedIds.valueForKey("lessonid") as! NSInteger as Int
        }
    }
    
    func setMessage(statusMessage: String) {
        self.message = statusMessage
    }
    
    
    func httpPost () {
        
        setCourse()
        setLesson()
        
        let parameters = [
            "course_id": courseId,
            "lessons_id": lessonsId,
            "s_name": s_name,
            "student_number": studentNumber
        ]
        
        Alamofire.request(.POST, "http://82.196.15.60:8081/attend/", parameters: parameters as! [String : AnyObject])
            .responseJSON{response in
                    if let httpStatusCode = response.response?.statusCode {
                        switch(httpStatusCode) {
                        case 401:
                            self.message = "Wrong username or ID."
                        case 402:
                            self.message = "You do not belong to this course."
                        case 403:
                            self.message = "You are already part of this course."
                        case 500:
                            self.message = "Status 500: Internal Server Error."
                        default:
                            self.message = "Huutista!"
                        }
                    } else {
                        //message = error.localizedDescription
                    }
                    
                    print(self.message)
                
        }
        
    }
}
