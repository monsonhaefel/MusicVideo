//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by RICHARD MONSON-HAEFEL on 8/11/16.
//  Copyright © 2016 Uncommon Design, Inc. All rights reserved.
//

import Foundation

class Videos {
    
    var vRank = 0
    // Data encapsulation
    private var _vName:String
    private var _vRights:String
    private var _vPrice:String
    private var _vImageUrl:String
    private var _vArtist:String
    private var _vVideoUrl:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDte:String
    
    // This variable gets created from the UI
    var vImageData:NSData?
    
    //Make a getter
    
    var vName: String {
        return _vName
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vArtist: String {
        return _vArtist
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vImid:String {
        return _vImid
    }
    
    var vGenre:String {
        return _vGenre
    }
    
    var vLinkToiTunes:String {
        return _vLinkToiTunes
    }
    
    var vReleaseDte:String {
        return _vReleaseDte
    }
    
 
    
    init(data: JSONDictionary){
        
        // If we do not initialize all the properties we will get an error message
        // Return from initalizer without intizliaing all stored properitess.
        
        //# MARK: - Parsing JSON Data
        
        //# MARK:  Name
        if let name = data["im:name"] as? JSONDictionary, vName = name["label"] as? String {
                _vName = vName
        }else{
            // You may not always get data back from JSON - you may want to display message
            // element in the JSON is unexpected
            
            _vName = ""
        }
        
        //# MARK: Rights
        if let rights = data["rights"] as? JSONDictionary, vRights = rights["label"] as? String {
                _vRights = vRights
        } else {
            _vRights = ""
        }
        
        //# MARK: Price
        if let price = data["im:price"] as? JSONDictionary, attributes = price["attributes"] as? JSONDictionary, vAmount = attributes["amount"] as? String {
                _vPrice = vAmount
        } else {
            _vPrice = ""
        }
        
        
        //# MARK: Image URL
        if let img = data["im:image"] as? JSONArray, image = img[2] as? JSONDictionary, immage = image["label"] as? String {
            _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        } else {
            _vImageUrl = ""
        }
        
        //# MARK: Artist
        if let artist = data["im:artist"] as? JSONDictionary, label = artist["label"] as? String {
                _vArtist = label
        } else {
            _vArtist = ""
        }
        
        //# MARK: Video URL
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
                _vVideoUrl = vVideoUrl
        } else {
            _vVideoUrl = ""
        }
        
        //# MARK: Id
        if let id = data["id"] as? JSONDictionary, attributes = id["attributes"] as? JSONDictionary, label = attributes["im:id"] as? String {
            _vImid = label
        } else {
            _vImid = ""
        }
        
        //# MARK: Genra
        if let category = data["category"] as? JSONDictionary, attributes = category["attributes"] as? JSONDictionary, term = attributes["term"] as? String{
            _vGenre = term
        } else {
            _vGenre = ""
        }
        
        //# MARK: Link to iTunes
        if let id = data["id"] as? JSONDictionary, label = id["label"] as? String {
            _vLinkToiTunes = label
        } else {
            _vLinkToiTunes = ""
        }
        
        //# MARK: Release Date
        if let releaseDate = data["im:releaseDate"] as? JSONDictionary, attributes = releaseDate["atttibutes"] as? JSONDictionary, label = attributes["label"] as? String {
                _vReleaseDte = label
        } else {
            _vReleaseDte = ""
        }
    }
    
}
