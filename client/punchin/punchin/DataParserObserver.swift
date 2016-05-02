//
//  DataParserObserver.swift
//  punchin
//
//  Created by Carla Miettinen on 21/04/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import Foundation


protocol DataParserObserver {
    func dataParsed (classroom: Room)
    
    func studentParsed (students: [Student])
    
}

