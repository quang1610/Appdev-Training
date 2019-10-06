//
//  CatTableViewCell.swift
//  Appdev Training
///Users/nguyenducquang/Library/Autosave Information/Appdev Training/Appdev Training/CatTableViewCell.swift
//  Created by Nguyễn Đức Quang on 9/28/19.
//  Copyright © 2019 Nguyễn Đức Quang. All rights reserved.
//

import UIKit

class CatTableViewCell: UITableViewCell {

    @IBOutlet weak var CatName: UILabel!
    @IBOutlet weak var CatImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
