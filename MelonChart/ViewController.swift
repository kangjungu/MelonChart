//
//  ViewController.swift
//  MelonChart
//
//  Created by JHJG on 2016. 4. 10..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class ViewController: UITableViewController {
    
    var items = MelonDBManager.instance.getList()
    
    
    @IBOutlet var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //섹션 개수
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        //return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MYCELL", forIndexPath: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].artist
        
        return cell
    }
    
    @IBAction func OnSyncClick(sender: AnyObject) {
        if items.count != 0 {
            print("all delete")
            MelonDBManager.instance.allDelete()
            mTableView.reloadData()
            getMelon()
        }else{
            print("getMelon")
            getMelon()
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        mTableView.reloadData()
    }
    
    func getMelon(){
        
        
        Alamofire
            .request(.GET, "http://apis.skplanetx.com/melon/charts/todaytopsongs?count=100&appKey=0a1c8977-fbf6-3be2-aeba-82395c563b63&page=1&version=1")
            .responseJSON{
                response in
                
                //list를 가져옴
                let melonList = MelonList(json: response.result.value as! JSON);
                
                //노래를 배열형식으로 만듬
                let song :[Song] = [Song].fromJSONArray((melonList?.melon?.songs?.song)!)
                
                for i in 0 ..< 100 {
                    
                    let title = song[i].songName
                    let artists :[Artist] = [Artist].fromJSONArray((song[i].artists?.artist)!)
                    var artist = ""
                    
                    for j in 0 ..< artists.count {
                        artist += artists[j].artistName!+" "
                    }
                    let melonData : MelonData = MelonData()
                    
                    melonData.id = MelonDBManager.instance.generateId()
                    melonData.title = title!
                    melonData.artist = artist
                    
                    MelonDBManager.instance.add(melonData)
                    
                }
         
                print("reloadData")
                //테이블 뷰를 다시 그려준다.
                self.mTableView.reloadData()
        }
        
    }
    
}

