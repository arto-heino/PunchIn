//
//  Lesson.swift
//  punchin
//
//  Created by Carla Miettinen on 22/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation


class Lesson {
    
    
    var lessonId: Int = 0
    var classId: Int = 0
    var startTime: String = ""
    var endTime: String = ""
    var lessonTitle: String = ""
    var teachers: String = ""
    var courseId: Int = 0
    
    
    
    
    func getLessonId() -> Int {
        return lessonId
    }
    
}