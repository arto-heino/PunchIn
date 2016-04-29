//
//  Lessons.swift
//  punchin
//
//  Created by Carla Miettinen on 22/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation



final class Lessons : ResponseObjectSerializable {
    
    let lessonTitle: String
    let teachers: String
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.lesson_title = representation.valueForKeyPath("lesson_title") as String
        self.teachers = representation.valueForKeyPath("teachers") as! String
    }
}
