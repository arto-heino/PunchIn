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
    var number = Int ()
    var lesson = Lesson()
    
    init(title: String, number: Int) {
        self.title = title
        self.number = number
    }
    func getRoomTitle() -> String {
        return title
    }
    func getRoomNumber() -> Int {
        return number
    }
    
    
    
}