//
//  ViewController.swift
//  MusicVideo
//
//  Created by RICHARD MONSON-HAEFEL on 8/9/16.
//  Copyright © 2016 Uncommon Design, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var videos = [Videos]()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var displayLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Observer for network status changed as reported by AppDelegate
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.reachabilityStatusChanged), name: REACH_STATUS_CHANGED, object: nil)
        
        //Call API
        let api = APIManager()
        api.loadData("http://itunes.apple.com/us/rss/topmusicvideos/limit=50/json", completion: didLoadData)
        
        reachabilityStatusChanged()

        
        /* As an alternative use trailing closure.
         api.loadData("http://itunes.apple.com/us/rss/topmusicvideos/limit=10/json"){
            (result:String) in
                print(result)
         }
         */
    }
    

    func didLoadData(videos:[Videos]){
        
        print(reachabilityStatus)
        
        self.videos = videos
        
        // print out to console
        for (index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
        
        tableView.reloadData()

    }
    
    func reachabilityStatusChanged(){
        
        switch reachabilityStatus {
        case NOACCESS :
            view.backgroundColor = UIColor.redColor()
            displayLabel.text = "No Internet"
        case WIFI :
            view.backgroundColor = UIColor.greenColor()
            displayLabel.text = "Reachable with WIFI"
        case WWAN :
            view.backgroundColor = UIColor.yellowColor()
            displayLabel.text = "Reachable with Cellular"
        default:
            return
            
        }
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: REACH_STATUS_CHANGED, object: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let video = videos[indexPath.row]
        
        cell.textLabel?.text = ("\(indexPath.row + 1)")
        cell.detailTextLabel?.text = video.vName
        
        
        return cell
    }



}

