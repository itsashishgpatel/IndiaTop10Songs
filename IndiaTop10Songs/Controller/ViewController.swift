//
//  ViewController.swift
//  IndiaTop10Songs
//
//  Created by IMCS2 on 12/28/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    // section for each song name so that we can have space between each cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return artistNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Top10Table.dequeueReusableCell(withIdentifier: "songsCell", for: indexPath) as! SongsTableViewCell
        
        let songName  = songNames[indexPath.section] // .section used instead of row so that in each section we have different song and all the songs that are fetched are displayed
        cell.singNameLabel.text = "Song Name : " + songName
        
        let artistName = artistNames[indexPath.section]
        
        cell.artistNamesLabel.text = "Artist Names : " + artistName
        
        cell.songImageCover.image = artistArtworks[indexPath.section]
        
        cell.songImageCover.layer.cornerRadius = 100  // corner radius for UIImageView
        cell.songImageCover.layer.borderColor = UIColor.blue.cgColor // border color as CGCOLOR is important
        cell.songImageCover.layer.borderWidth = 5  // border width for ImageView
        cell.songImageCover.clipsToBounds = true // needed because without this radius effect wont work
    
        cell.layer.cornerRadius = 25  // corner radius for Table View Cell
        cell.layer.borderWidth = 5
        
        return cell
        
    }
    
    // removing section separator line
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // cell's background color set to light grey
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.lightGray
        
    }
    
    var object = APIManager()
    
    var artistNames:[String] = []
    var songNames:[String] = []
    var artistArtworks:[UIImage] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       self.Top10Table.backgroundColor = UIColor.blue
 
        
        Top10Table.register(UINib(nibName:"SongsTableViewCell", bundle:nil), forCellReuseIdentifier: "songsCell")
        
        
        
        object.APICall { (results: Welcome) in
            
           let feed = results.feed
           let results = feed.results
           
            
            results.forEach({ (Result) in
                
                
                self.artistNames.append(Result.artistName)
                self.songNames.append(Result.name)
            
                
                let imageUrl = Result.artworkUrl100
                
                guard let url = URL(string: imageUrl) else {return}
        
                if let data = try? Data(contentsOf: url)
                {
                    let image: UIImage = UIImage(data: data)!
                    self.artistArtworks.append(image as UIImage)
                }
                print(self.artistArtworks.count)
                
                DispatchQueue.main.async {
                    
                    do{
                       sleep(3)  // sleep to fetch and convert the images or else it thorws out of bound error
                    
                    
//                        _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { (Timer) in
//                           
//                        })
                    
                    
                    }
                        self.Top10Table.reloadData()
                   
                }
                
            })
            
        }
    }

    @IBOutlet var Top10Table: UITableView!
    
}

