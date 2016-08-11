//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by RICHARD MONSON-HAEFEL on 8/11/16.
//  Copyright © 2016 Uncommon Design, Inc. All rights reserved.
//

import Foundation

class Videos {
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    
    //Make a getter
    
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    init(data: JSONDictionary){
        
        // If we do not initialize all the properties we will get an error message
        // Return from initalizer without intizliaing all stored properitess.
        
        // Video Name
        if let name = data["im:name"] as? JSONDictionary, vName = name["label"] as? String {
                self._vName = vName
        }else{
            // You may not always get data back from JSON - you may want to display message
            // element in the JSON is unexpected
            
            _vName = ""
        }
        
        //The Video Image
        if let img = data["im:image"] as? JSONArray, image = img[2] as? JSONDictionary, immage = image["label"] as? String {
            _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        } else {
            _vImageUrl = ""
        }
        
        //Video Url
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
                self._vVideoUrl = vVideoUrl
        } else {
            _vVideoUrl = ""
        }
    }
    
}
