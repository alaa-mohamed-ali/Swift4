//
//  MenuTableViewCell.swift
//  DataBase
//
//  Created by alaa on 8/4/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblTitle: UILabel!
    
    var txxx:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
