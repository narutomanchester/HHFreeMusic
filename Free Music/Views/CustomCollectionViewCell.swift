//
//  CustomCollectionViewCell.swift
//  Free Music
//
//  Created by mac on 11/30/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var labelKindOfSong: UILabel!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imgKindOfSong: UIImageView!
    
    
    func enter(url : String , nameImage : Int){
        self.ActivityIndicator.startAnimating()
        let downloadManager = DownloadManager()
        downloadManager.downloadTitleKindOfSong(url: url) { (title) in
            self.ActivityIndicator.stopAnimating()
            self.ActivityIndicator.isHidden = true
            self.labelKindOfSong.text = title
            self.imgKindOfSong.image = UIImage(named: "genre-\(nameImage)")
        }
    }
}
