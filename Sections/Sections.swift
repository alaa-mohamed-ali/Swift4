//
//  Sections.swift
//  DataBase
//
//  Created by alaa on 8/6/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit

class Sectionsx: Codable {
    let Items:[Sections]
    init(Items:[Sections]) {
        self.Items = Items
    }
}

class Sections: Codable {
    
    //var to databae array 
    var id:String
    var name:String
    var total:String
    var img:String
    
   /* init(id:String,name:String ,total:String,img:String) {
        self.id = id
        self.name = name
        self.total = total
        self.img = img
    }*/
}

