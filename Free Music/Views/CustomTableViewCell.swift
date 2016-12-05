//
//  CustomTableViewCell.swift
//  Free Music
//
//  Created by mac on 11/30/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgSong: UIImageView!
    @IBOutlet weak var lblSongName: UILabel!
    @IBOutlet weak var lblSongArtist: UILabel!
    @IBOutlet weak var CircleWhite: UIView!

    
    override func layoutSubviews() {
        self.CircleWhite.layer.isHidden = true
        self.imgSong.layer.cornerRadius = 20
        self.imgSong.layer.masksToBounds = true
    }
    func enter(song: SongModel) {        
        self.lblSongName.text = song.nameSong
        self.lblSongArtist.text = song.artistSong
        let downloadManafer = DownloadManager()
        downloadManafer.downloadImage(url: song.imgSong) { (image) in
            self.imgSong.image = image
        }
    }
}
