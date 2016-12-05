//
//  KindDeatil.swift
//  Free Music
//
//  Created by mac on 11/30/16.
//  Copyright © 2016 mac. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class KindDetail: UIViewController , UITableViewDelegate {

    @IBOutlet weak var lblTitleKindOfSong: UILabel!
    @IBOutlet weak var imgKindOfSong: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    var listSongs : Variable<[SongModel]> = Variable<[SongModel]>([])
    var disposeBag = DisposeBag()
    
    var urlformat : Int = 0
    var titleKindOfSong : String = ""
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        setupSongs()
        setupListSongs()
        setupTableView()
        
    }

    @IBAction func invokePopView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func setupSongs() {
        let urlSong = String(format: url, urlformat)
        
        let downloadMangager = DownloadManager()
        downloadMangager.downloadSong(url: urlSong) { (songs) in
            for song in songs {
                self.listSongs.value.append(song)
            }
            
        }
    }
    
    func setupListSongs() {
        
        listSongs.asObservable().bindTo (
            self.tableView.rx.items(cellIdentifier: "TableViewCell", cellType: CustomTableViewCell.self)
        
        ) { (index, song ,cell ) in
            cell.enter(song: song)
        }.addDisposableTo(disposeBag)
    }
    
    func setupTableView() {
        self.title = "Music World ©HiepHH"
        self.lblTitleKindOfSong.text = titleKindOfSong
        self.imgKindOfSong.image = UIImage(named: "genre-\(urlformat)")
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
        

        if (appDelegate.havingPlayBar) {
            
        } else {
            appDelegate.havingPlayBar = true
            appDelegate.addPlayerViewBar()
        }
        let playerView = CustomPlayerViewBar()
        guard let s = cell.lblSongName.text else {
            return
        }
        guard let ss = cell.lblSongArtist.text else {
            return
        }
        playerView.enter(imgSong: cell.imgSong, lblNameSong: s, lblArtistSong: ss)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
