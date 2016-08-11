//
//  ViewController.swift
//  MusicVideo
//
//  Created by RICHARD MONSON-HAEFEL on 8/9/16.
//  Copyright © 2016 Uncommon Design, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call API
        let api = APIManager()
        api.loadData("http://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)

        
        /* As an alternative use trailing closure.
         api.loadData("http://itunes.apple.com/us/rss/topmusicvideos/limit=10/json"){
            (result:String) in
                print(result)
         }
         */
    }
    



    func didLoadData(videos:[Videos]){
        
        self.videos = videos
        
        // this is best if you don't care to display the index
        for item in videos {
            print("name = \(item.vName)")
        }
        
        // this is the best way if you want to display the index
        for (index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
        
        /*  Somewhat old way: The below is the same as the above
         for i in 0..<videos.count {
            let video = videos[i]
            print("\(index) name = \(item.vName)")
         }
         */
        
        /*  Old way: The below is the same as the above
         for var i = 0; i < videos.count; i++ {
            let video = videos[i]
            print("\(index) name = \(item.vName)")
         }
         */
        
        
        
    }
    



}

