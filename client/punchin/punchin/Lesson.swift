//
//  Lesson.swift
//  punchin
//
//  Created by Carla Miettinen on 22/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation


class Lesson {
    
    
    
    var startTime: String = ""
    var endTime: String = ""
    var lessonTitle: String = ""
    var teachers: String = ""
    
    var courseId = [Int]()
    var lessonId = [Int]()
    
    
    
    
    func getLessonId() -> [Int] {
        return lessonId
    }
    
    func getStartTime() -> String {
        return startTime
    }
    
    func getEndTime() -> String {
        return endTime
    }
    
    func getLessonTitle() -> String {
        return lessonTitle
    }
    
    func getTeachers() -> String {
        return teachers
    }
    func getCourseId() -> [Int] {
        return courseId
    }
    
     // SETTERS
    
    
    func setLessonId(id: [Int]) {
        lessonId = id
    }
    
    func setStartTime(s_time: [String]) {
        startTime = String(s_time)
    }
    
    func setEndTime(e_time: [String])  {
        endTime = String(e_time)
    }
    
    func setLessonTitle(lessonName: [String]) {
        lessonTitle = String(lessonName)
    }
    
    func setTeachers(teachers_name: [String]) {
        teachers = String(teachers_name)
    }
    func setCourseId(course_id: [Int]) {
        courseId = course_id
    }
    
    
    
    
    
}