//
//  DiscoverViewController.swift
//  Free Music
//
//  Created by mac on 11/30/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

let url = "https://itunes.apple.com/us/rss/topsongs/limit=50/genre=%d/explicit=true/json"

class DiscoverViewController : UIViewController , UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var genreArray = [2,3,4,5,6,7,9,10,11,12,14,15,16,17,18,19,20,21,22,24,34,50,51]
    
    var arrayUrl:Variable<[String]> = Variable<[String]>([])
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        self.collectionView.delegate = self
        setupArrayUrl()
        setupCollectionView()
    }
    
    func setupArrayUrl() {
        for index in genreArray {
            let ss = String(format: url, index)
            arrayUrl.value.append(ss)
        }
    }
    
    func setupCollectionView(){
        arrayUrl.asObservable().bindTo(
            self.collectionView.rx.items(cellIdentifier: "Cell", cellType: CustomCollectionViewCell.self)
        
        ) { (index , url , cell) in
            cell.enter(url: url, nameImage: self.genreArray[index])
            
        }.addDisposableTo(self.disposeBag)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        
        let Kind = self.storyboard?.instantiateViewController(withIdentifier: "KindDetail") as! KindDetail
        
        Kind.urlformat = genreArray[indexPath.row]
        Kind.titleKindOfSong = cell.labelKindOfSong.text!
        
        self.navigationController?.pushViewController(Kind, animated: true)
        
    }

}

