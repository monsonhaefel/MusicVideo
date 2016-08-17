//
//  MusicVideoDetailVC.swift
//  MusicVideo
//
//  Created by RICHARD MONSON-HAEFEL on 8/17/16.
//  Copyright © 2016 Uncommon Design, Inc. All rights reserved.
//

import UIKit

class MusicVideoDetailVC: UIViewController {
    
    var videos: Videos!

    @IBOutlet weak var vRights: UILabel!
    @IBOutlet weak var vGenra: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var vName: UILabel!
    @IBOutlet weak var vPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vName.text = videos.vName
        vGenra.text = videos.vGenre
        vPrice.text = videos.vPrice
        vRights.text = videos.vRights
        
        if videos.vImageData != nil{
            videoImage.image = UIImage(data: videos.vImageData!)
        } else {
            videoImage.image = UIImage(named:"imageNotAvailable")
        }

    }

}
