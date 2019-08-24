//
//  Actor.swift
//  DataBase
//
//  Created by alaa on 7/29/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit

class ActorCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDOB: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var txtCost: UILabel!
    
    var tels:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
