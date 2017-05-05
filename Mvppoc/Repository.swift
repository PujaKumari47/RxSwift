//
//  Repository.swift
//  Mvppoc
//
//  Created by Puja Kumari on 5/5/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import Mapper

struct Repository: Mappable {
    
    let identifier: Int
    let language: String
    let name: String
    let fullName: String
    
    init(map: Mapper) throws {
        try identifier = map.from("id")
        try language = map.from("language")
        try name = map.from("name")
        try fullName = map.from("full_name")
    }
}
