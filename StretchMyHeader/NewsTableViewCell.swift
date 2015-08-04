//
//  NewsTableViewCell.swift
//  StretchMyHeader
//
//  Created by Jeff Huang on 2015-08-04.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelHeadline: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
