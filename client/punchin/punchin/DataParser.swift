//
//  DataParser.swift
//  punchin
//
//  Created by Carla Miettinen on 20/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation


class DataParser{
    
    
    let string = "{\"name\": \"John\", \"age\": 35, \"children\": [\"Jack\", \"Jill\"]}"
    
    func JSONParseDictionary(string: String) -> [String: AnyObject]{
        
        
        if let data = string.dataUsingEncoding(NSUTF8StringEncoding){
            
            do{
                if let dictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [String: AnyObject]{
                    
                    return dictionary
                    
                }
            }catch {
                
                print("error")
            }
        }
        return [String: AnyObject]()
    }
    
    
    let dictionary = JSONParseDictionary(string)
    
    let name = dictionary["name"] as? String                    // John
    let age = dictionary["age"] as? Int                         // 35
    let firstChild = dictionary["children"]?[0] as? String      // Jack
    let secondChild = dictionary["children"]?[1] as? String     // Jill
}
