//
//  DownloadManager.swift
//  Free Music
//
//  Created by mac on 11/30/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation
import AlamofireImage
import Alamofire
import SwiftyJSON

class DownloadManager {
    
    func downloadTitleKindOfSong(url : String , completed : @escaping(_ title : String) -> Void) {
        
        request(url).responseJSON { (response) in
            guard let value  = response.result.value else {
                return
            }
            guard let title = JSON(value)["feed"]["title"]["label"].string else {
                return
            }
            completed(title.replacingOccurrences(of: "iTunes Store: Top Songs in ", with: ""))
        }
        
    }
    
    func downloadImage(url: String, completed: @escaping(_ image: UIImage) -> Void) {
        
        request(url).responseImage(completionHandler: { (response) in
            guard let image = response.result.value else {
                return
            }
            completed(image)
        })
    }
    
    func downloadSong(url : String , completed : @escaping(_ song : [SongModel]) -> Void){
        
        request(url).responseJSON { (response) in
            guard let value  = response.result.value else {
                return
            }
            
            guard let entries = JSON(value)["feed"]["entry"].array else {
                return
            }
            var songs = [SongModel]()
            for index in entries {
                guard let imgSong = index["im:image"][0]["label"].string else {
                    return
                }
                
                guard let nameSong = index["im:name"]["label"].string else {
                    return
                }
                guard let artistSong = index["im:artist"]["label"].string else {
                    return
                }
                
                let song = SongModel(imgSong: imgSong, nameSong: nameSong, artistSong: artistSong)
                songs.append(song)

            }
            completed(songs)
        }
        
        
    }
    
}
