//
//  User.swift
//  punchin
//
//  Created by Carla Miettinen on 29/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation



class User {
    
    var lastname: String
    var studentId: String
    
    init?(lastname: String, studentId: String) {
        self.lastname = lastname
        self.studentId = studentId
        
        
        if lastname.isEmpty || studentId.isEmpty{
            return nil
        }
    }
    
    
    
}