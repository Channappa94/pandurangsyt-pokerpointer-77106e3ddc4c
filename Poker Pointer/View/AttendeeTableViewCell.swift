//
//  AttendeeTableViewCell.swift
//  Poker Pointer
//
//  Created by IMCS2 on 3/3/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import UIKit

class AttendeeTableViewCell: UITableViewCell {

    @IBOutlet weak var AttendeeName: UILabel!
    @IBOutlet weak var AttendeePointImageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
