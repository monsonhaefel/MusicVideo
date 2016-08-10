//
//  ViewController.swift
//  MusicVideo
//
//  Created by RICHARD MONSON-HAEFEL on 8/9/16.
//  Copyright © 2016 Uncommon Design, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    



    func didLoadData(result:String){
        
        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { action -> Void in
            // do something
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }


}

