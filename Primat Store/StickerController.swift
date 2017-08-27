//
//  StickerView.swift
//  Primat Store
//
//  Created by Anton Pobigai on 26.08.17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import Foundation

class Sticker {
    
    var name: String
    var price: String?
    var size: String
    var label: String?
    var logotip: URL?
    var details: String
    
    init (name: String, price: String?, size: String, lable: String, logotip: URL?, details: String){
        
        self.name = name
        self.price = price
        self.size = size
        self.label = lable
        self.logotip = logotip
        self.details = details
        
    }
    
}
