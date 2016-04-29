//
//  Room.swift
//  punchin
//
//  Created by Carla Miettinen on 22/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation


class Room {
    
    
    var title = String()
    var number = String()
    var lesson = Lesson()
    var lessonId = Int()

    func getRoomTitle() -> String {
        return title
    }
    func getRoomNumber() -> String {
        return number
    }
    func getLessonId() -> Int {
        return lessonId
    }
    
    func setRoomTitle(room_name: String) {
        title = room_name
    }
    
    func setRoomNumber(room_number: String) {
        number = room_number
    }
    
    func setLessonId(lesson_id: Int) {
        lessonId = lesson_id
    }
    
}