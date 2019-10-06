//
//  AddCatTableViewCell.swift
//  Appdev Training
//
//  Created by Nguyễn Đức Quang on 10/4/19.
//  Copyright © 2019 Nguyễn Đức Quang. All rights reserved.
//

import UIKit

class AddCatTableViewCell: UITableViewCell {
    @IBOutlet weak var AddCatTextView: UITextView!
    @IBOutlet weak var AddCatPickerView: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
