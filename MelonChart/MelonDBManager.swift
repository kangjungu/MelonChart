//
//  MelonDBManager.swift
//  MelonChart
//
//  Created by JHJG on 2016. 4. 19..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import RealmSwift

class MelonDBManager{
    
    static let instance = MelonDBManager()
    
    let realm = try! Realm()
    
    func generateId() -> Int{
        let result =  realm.objects(MelonData).sorted("id", ascending: true)
        
        if result.count == 0{
            return 0;
        }else{
            return ((result.last?.id)!+1)
        }
    }
    
    func add(data : MelonData){
        try! realm.write({ 
            realm.add(data)
        })
    }
    
    func update(data : MelonData){
        try! realm.write({ 
            realm.add(data, update: true)
        })
    }
    
    func getMelonData(id : Int) -> MelonData{
        try! realm.write({ 
            return realm.objects(MelonData).filter("id = \(id)")
        })
    
        return MelonData()
    }
    
    func getList() -> Results<MelonData>{
        return realm.objects(MelonData)
    }
    
    func allDelete(){
        try! realm.write({ 
            realm.deleteAll()
        })
    }
}
