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
    
    init(){}
    
    
    func getBeaconData(major: NSNumber, parserObserver: DataParserObserver) {
        
        var roomTitle: String = ""
        var roomNumber: String = ""
        var lessonTitle: String = ""
    //    var teachers: String = ""


        
        
        Alamofire.request(.GET, "http://82.196.15.60:8081/info/\(major)")
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    let response = JSON as! NSDictionary
                    
                    roomTitle = response.objectForKey("room_title") as! String
                    roomNumber = response.objectForKey("room_number") as! String
                    let lessonTitle = response.valueForKeyPath("lessons.lesson_title") as! [String]
                    let teachers = response.valueForKeyPath("lessons.teachers") as! [String]
                    //room = Room(roomTitle,roomNumber, Lesson(teachers,lessonTitle))
                        print(lessonTitle)
                        print(teachers)
                        
    
                    //create a Room object and pass it to the observer
                    parserObserver.dataParsed(roomTitle, roomNumber: roomNumber)
                    
                    print("JSON: \(JSON)")
                }
                
        
    }
    
    
    
    }
}