//
//  MusicVideoTableViewCell.swift
//  MusicVideo
//
//  Created by RICHARD MONSON-HAEFEL on 8/16/16.
//  Copyright © 2016 Uncommon Design, Inc. All rights reserved.
//

import UIKit

class MusicVideoTableViewCell: UITableViewCell {
    
    var video: Videos? {
        didSet{
            updateCell()
        }
    }

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var musicTitle: UILabel!
    
    func updateCell(){
        
        musicTitle.text = video?.vName
        rank.text = ("\(video!.vRank)")
        musicImage.image = UIImage(named:"imageNotAvailable")
        
    }
}
