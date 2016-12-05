//
//  CustomPlayerViewBar.swift
//  Free Music
//
//  Created by mac on 12/1/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class CustomPlayerViewBar : UIView {
    
    @IBOutlet weak var imgSong: UIImageView!
    @IBOutlet weak var lblNameSong: UILabel!
    @IBOutlet weak var lblArtistSong: UILabel!
    func enter(imgSong : UIImageView , lblNameSong : String , lblArtistSong : String) {
        self.imgSong = imgSong
        print(lblNameSong)
        
        self.lblNameSong.text = lblNameSong
        
        print(self.lblNameSong.text)
     //   self.lblArtistSong = lblArtistSong
    }
    
}
