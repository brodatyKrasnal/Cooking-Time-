//
//  File.swift
//  Cooking Time!
//
//  Created by Daniel Golęba Frygies on 14/04:105.
//  Copyright © 2020 Tymon Golęba Frygies. All rights reserved.
//

import Foundation

struct Product {
    var name: String
    var cookingTime: Int
    var description: String
    
    
    init(name: String, time: Int, desc: String) {
        self.name = name
        cookingTime = time
        description = desc
    }
}
