//
//  ExamDetailTableViewCell.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/9/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class ExamDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var labelContent: UILabel!
    
    @IBOutlet weak var labelValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
