//
//  Song.swift
//  MelonChart
//
//  Created by JHJG on 2016. 4. 10..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import Gloss

struct Song : Decodable {
    let songName : String?
    let albumName : String?
    let artists : Artists?
    
    init?(json: JSON) {
        songName = "songName" <~~ json
        albumName = "albumName" <~~ json
        artists  = "artists" <~~ json
    }
}