//
//  DataParser.swift
//  punchin
//
//  Created by Carla Miettinen on 20/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//(.GET, "82.196.15.60:8081/info/\(major)")

import Foundation
import Alamofire


class DataParser {
    
    init(){
    }
    
   
    
    func getBeaconData(major: NSNumber, parserObserver: DataParserObserver) -> Room {
        
         let classroom = Room()
        
        Alamofire.request(.GET, "http://82.196.15.60:8081/info/\(major)")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    let response = JSON as! NSDictionary
                    
                    
                    
                    classroom.setRoomTitle(response.objectForKey("room_title") as! String)
                    classroom.setRoomNumber(response.objectForKey("room_number") as! String)

                    
                    classroom.lesson.setLessonTitle(response.valueForKeyPath("lessons.lesson_title") as! [String])
                    classroom.lesson.setTeachers(response.valueForKeyPath("lessons.teachers") as! [String])
                    classroom.lesson.setCourseId(response.valueForKeyPath("lessons.course_id") as! [Int])
                    classroom.lesson.setLessonId(response.valueForKeyPath("lessons.id") as! [Int])
                    classroom.setLessonId(classroom.lesson.getLessonId() )
                    

                    parserObserver.dataParsed(classroom)
                }
        
    }
           return classroom
    
    
    
    }
    
    func getAttendList(lessonId: Int, parserObserver: DataParserObserver) {

        Alamofire.request(.GET, "http://82.196.15.60:8081/attends/\(lessonId)")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    var students: [Student] = [Student]()
                    
                    let response = JSON as! NSArray
                    for index in 0..<response.count{
                        print(response[index].valueForKeyPath("students.f_name") as! [String])

                        let firstName = response[index].valueForKeyPath("students.f_name") as! [String]
                        let surname = response[index].valueForKeyPath("students.s_name") as! [String]
                        let student = Student(firstName: firstName.first!, surname: surname.first!)
                        
                        students.append(student)
                        
                    }
                    parserObserver.studentParsed(students)
                }
        }

    }
    
}