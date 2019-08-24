//
//  SubSections.swift
//  DataBase
//
//  Created by alaa on 8/6/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit


class SubSectionsx: Codable {
    let Items:[SubSections]
    init(Items:[SubSections]) {
        self.Items = Items
    }
}

class SubSections: Codable {
    var id:String
    var name:String
    var total:String
    
    
    init(id:String,name:String ,total:String) {
        self.id = id
        self.name = name
        self.total = total
        
        
    }
}
