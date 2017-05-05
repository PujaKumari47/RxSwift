//
//  Issues.swift
//  Mvppoc
//
//  Created by Puja Kumari on 5/5/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import Mapper

struct Issue: Mappable {
    
    let identifier: Int
    let number: Int
    let title: String
    let body: String
    
    init(map: Mapper) throws {
        try identifier = map.from("id")
        try number = map.from("number")
        try title = map.from("title")
        try body = map.from("body")
    }
}
