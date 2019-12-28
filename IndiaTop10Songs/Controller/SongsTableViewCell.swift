//
//  SongsTableViewCell.swift
//  IndiaTop10Songs
//
//  Created by IMCS2 on 12/28/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class SongsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet var singNameLabel: UILabel!
    
    @IBOutlet var artistNamesLabel: UILabel!
    @IBOutlet var songImageCover: UIImageView!
    

    
}
