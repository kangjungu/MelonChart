//
//  Song.swift
//  MelonChart
//
//  Created by JHJG on 2016. 4. 10..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import Gloss

struct Songs : Decodable {
    
    let song : [JSON]?
    
    init?(json: JSON) {
        song = "song" <~~ json
    }
}
