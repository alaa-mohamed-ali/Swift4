//
//  Actor.swift
//  DataBase
//
//  Created by alaa on 7/29/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit

class Actors: Codable {
    let Items:[Actor]
    init(Items:[Actor]) {
        self.Items = Items
    }
}

class Actor: Codable {
    var id:String
    var name:String
    var content:String
    //var pic:String
    var pic1:String
    var pic2:String
    var pic3:String
    var pic4:String
    var cost:String
    var namesubSection:String
    
    init(id:String,name:String,content:String,pic1:String,pic2:String,pic3:String,pic4:String,cost:String,namesubSection:String) {
        self.id = id
        self.name = name
        self.content = content
        self.pic1 = pic1
        self.pic2 = pic2
        self.pic3 = pic3
        self.pic4 = pic4
        self.cost = cost
        self.namesubSection = namesubSection
    }
}
