//
//  HeaderTableViewCell.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/9/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var labelExamTitle: UILabel!
    
    @IBOutlet weak var lableValidFrom: UILabel!
    
    @IBOutlet weak var labelValidTo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
