//
//  MelonData.swift
//  MelonChart
//
//  Created by JHJG on 2016. 4. 14..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import RealmSwift

class MelonData: Object {

    dynamic var id = 0
    dynamic var title = ""
    dynamic var artist = ""
    
    override static func primaryKey() ->String?{
        return "id"
    }
    

    
}
