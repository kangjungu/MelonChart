//
//  List.swift
//  MelonChart
//
//  Created by JHJG on 2016. 4. 10..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import Gloss

struct MelonList : Decodable{
    
    let melon : Melon?
    
    init?(json: JSON) {
        melon = "melon" <~~ json
    }
}


