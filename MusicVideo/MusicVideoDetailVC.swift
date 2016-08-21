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

    @IBAction func socialMedia(sender: UIBarButtonItem) {
        shareMedia()
    }
    
    func shareMedia() {
        
        let textLine1 = "Have you had the opportunity to see this Music Video?"
        let textLine2 = ("\(videos.vName) by \(videos.vArtist)")
        let textLine3 = "Watch it and tell me what you think?"
        let textLine4 = videos.vLinkToiTunes
        let textLine5 = "(Shared with the Music Video App - Step It UP!)"
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [textLine1, textLine2, textLine3, textLine4,textLine5], applicationActivities: nil)
        
        //activityViewController.excludedActivityTypes =  [UIActivityTypeMail]
        
        
        
        //        activityViewController.excludedActivityTypes =  [
        //            UIActivityTypePostToTwitter,
        //            UIActivityTypePostToFacebook,
        //            UIActivityTypePostToWeibo,
        //            UIActivityTypeMessage,
        //            UIActivityTypeMail,
        //            UIActivityTypePrint,
        //            UIActivityTypeCopyToPasteboard,
        //            UIActivityTypeAssignToContact,
        //            UIActivityTypeSaveToCameraRoll,
        //            UIActivityTypeAddToReadingList,
        //            UIActivityTypePostToFlickr,
        //            UIActivityTypePostToVimeo,
        //            UIActivityTypePostToTencentWeibo
        //        ]
        
        activityViewController.completionWithItemsHandler = {
            (activity, success, items, error) in
            
            if activity == UIActivityTypeMail {
                print ("email selected")
            }
            
        }
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
        
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
