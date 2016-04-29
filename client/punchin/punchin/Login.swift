//
//  Login.swift
//  punchin
//
//  Created by Carla Miettinen on 29/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation



class Login: NSCoder {
    
    
    var lastname: String
    var studentId: String
    
    init?(lastname: String, studentId: String) {
        self.lastname = lastname
        self.studentId = studentId
        
        super.init()
        
        if lastname.isEmpty || studentId.isEmpty{
            return nil
        }
    }
    
    
    
    struct PropertyKey {
        static let lastnameKey = "lastname"
        static let studentIdKey = "studentId"
        
    }
    
    func setUserData 
    
    
    //NSCODING
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(lastname, forKey: PropertyKey.lastnameKey)
        aCoder.encodeObject(studentId, forKey: PropertyKey.studentIdKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        
        
        let lastname = aDecoder.decodeObjectForKey(PropertyKey.lastnameKey) as! String
        let studentId = aDecoder.decodeObjectForKey(PropertyKey.studentIdKey) as! String
        
        self.init(lastname: lastname, studentId: studentId)
        
        
    }
    
    
    //ARCHIVING
    
    
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("login")
    
    
    
    
    
    
    
}