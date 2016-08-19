//
//  MusicVideoDetailVC.swift
//  MusicVideo
//
//  Created by RICHARD MONSON-HAEFEL on 8/17/16.
//  Copyright © 2016 Uncommon Design, Inc. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MusicVideoDetailVC: UIViewController {
    
    var videos:Videos!

    @IBOutlet weak var vName: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var vGenra: UILabel!
    @IBOutlet weak var vPrice: UILabel!
    @IBOutlet weak var vRights: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = videos.vArtist
        
        vName.text = videos.vName
        vPrice.text = videos.vPrice
        vRights.text = videos.vRights
        vGenra.text = videos.vGenre
        
        if videos.vImageData != nil {
            videoImage.image = UIImage(data: videos.vImageData!)
        }else {
            videoImage.image = UIImage(named: "imageNotAvailable")
        }
    }

    @IBAction func playVideo(sender: UIBarButtonItem) {
        
        let url = NSURL(string: videos.vVideoUrl)
        
        let player = AVPlayer(URL: url!)
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.presentViewController(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }


}
