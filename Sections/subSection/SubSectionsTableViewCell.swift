//
//  SubSectionsTableViewCell.swift
//  DataBase
//
//  Created by alaa on 8/6/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit

class SubSectionsTableViewCell: UITableViewCell {

    @IBOutlet weak var txtNameSubSection: UILabel!
    
    
    @IBOutlet weak var txttotalSubSection: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
