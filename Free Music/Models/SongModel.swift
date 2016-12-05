//
//  SongModel.swift
//  Free Music
//
//  Created by mac on 11/30/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation

class SongModel {
    var imgSong : String!
    var nameSong : String!
    var artistSong : String!
    
    init(imgSong : String , nameSong : String , artistSong : String) {
        self.artistSong = artistSong
        self.imgSong = imgSong
        self.nameSong = nameSong
    }
}
