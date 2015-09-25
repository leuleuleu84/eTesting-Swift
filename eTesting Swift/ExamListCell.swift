//
//  ExamListCell.swift
//  eTesting Swift
//
//  Created by Minh Thang on 9/9/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit    

class ExamListCell: UITableViewCell {
    
    @IBOutlet weak var examTitle: UILabel!
    @IBOutlet weak var labelValidFrom: UILabel!
    @IBOutlet weak var labelValidTo: UILabel!
    @IBOutlet weak var labelAmountOfRegister: UILabel!
    
    @IBOutlet weak var labelRegisterType: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
