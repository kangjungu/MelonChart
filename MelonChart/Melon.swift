//
//  Melon.swift
//  MelonChart
//
//  Created by JHJG on 2016. 4. 10..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import Gloss

struct Melon: Decodable{
    let count : Int?
    let menuid : Int?
    let page : Int?
    let songs : Songs?
    let totalPages : Int?
    
    init?(json: JSON) {
        count = "count" <~~ json
        menuid = "menuId" <~~ json
        page =  "page" <~~ json
        songs = "songs" <~~ json
        totalPages = "totalPages" <~~ json
    }
}
