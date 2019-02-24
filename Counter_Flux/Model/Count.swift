//
//  Sample.swift
//  Counter_Flux
//
//  Created by 横山新 on 2019/02/21.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation

struct Count: Equatable, Codable {
    var count: Int
    
    init() {
        count = 0
    }
    
    mutating func increase() {
        count += 1
    }
    
    mutating func decrease() {
        count -= 1
    }
}
