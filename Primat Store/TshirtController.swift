//
//  TshirtView.swift
//  Primat Store
//
//  Created by Anton Pobigai on 26.08.17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import Foundation

class Tshirt{
    
    var name: String
    var picture: URL?
    var color: String?
    var size: String?
    var sex: String?
    var price: String?
    var lable: String?
    var material: String?
    
    init(name: String, picture: URL?, color: String?, size: String?, sex: String?, price: String?, lable: String, material: String? ) {
        
        self.name = name
        self.picture = picture
        self.color = color
        self.size = size
        self.sex = sex
        self.price = price
        self.lable = lable
        self.material = material
        
    }
    
}
