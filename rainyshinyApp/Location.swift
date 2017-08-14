//
//  Location.swift
//  rainyshinycloudy
//
//  Created by SEAN on 2017/8/10.
//  Copyright © 2017年 SEAN. All rights reserved.
//

import Foundation

class Location {
    static var sharedInstance = Location() //static var => global var
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
