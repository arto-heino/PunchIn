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
    
    
    
    
    func getLessonId() -> Int {
        return lessonId.first!
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
    func getCourseId() -> Int {
        return courseId.first!
    }
    
     // SETTERS
    
    
    func setLessonId(less_id: [Int]) {
        lessonId = less_id
    }
    
    func setCourseId(course_id: [Int]) {
        courseId = course_id
    }
    
    func setStartTime(s_time: [String]) {
        let stringArray = s_time
        let characterArray = stringArray.flatMap { String.CharacterView($0) }
        startTime = String(characterArray)
    
    }
    
    func setEndTime(e_time: [String])  {
        let stringArray = e_time
        let characterArray = stringArray.flatMap { String.CharacterView($0) }
        let string = String(characterArray)
        endTime = string
    }
    
    func setLessonTitle(lessonName: [String]) {
        let stringArray = lessonName
        let characterArray = stringArray.flatMap { String.CharacterView($0) }
        let string = String(characterArray)
        lessonTitle = string
    }
    
    func setTeachers(teachers_name: [String]) {
        
        let stringArray = teachers_name
        let characterArray = stringArray.flatMap { String.CharacterView($0) }
        let string = String(characterArray)
        teachers = string
    }

    
    
    
    
}