//
//  Students.swift
//  punchin
//
//  Created by Arto Heino on 02/05/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation

class Students{
    
    var users = [String]()
    
    init(){}
    
    func getUsers() -> [String] {
        return users
    }
    
    func getUsersCount() -> Int {
        return users.count
    }
    
    func setUsers(usersList: [String]) {
        users = usersList
    }
    
}