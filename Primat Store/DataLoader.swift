//
//  DataLoader.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/27/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import Foundation
import Parse

class DataLoader {

    func requestStickers(stickersLoaded: @escaping () -> Void) {
     
        let query = PFQuery(className: "Sticker")
        query.findObjectsInBackground { (objects, error) in
            
            if error == nil {
                if let objects = objects {
                    let stickers = objects.map({ (object) -> StickerVO in
                        StickerVO(name: object.value(forKey: "name") as! String,
                                  picture: URL(string:(object.value(forKey: "pictureURL") as! String))! ,
                                  price: object.value(forKey: "price") as! Double,
                                  size: object.value(forKey: "size") as! String)
                    })
                    
                    Model.instance.setStickers(stickers: stickers)
                    stickersLoaded()
                }
            }
            
        }
    }
    
    func requestTshirts(tshirtsLoaded: @escaping () -> Void) {
        
        let query = PFQuery(className: "TShirt")
        query.findObjectsInBackground { (objects, error) in
            
            if error == nil {
                if let objects = objects {
                    let tshirts = objects.map({ (object) -> TShirtVO in
                        TShirtVO(nameOfPrint: object.value(forKey: "nameOfPrint") as! String,
                                 picture: URL(string:(object.value(forKey: "pictureURL") as! String))!,
                                 price: object.value(forKey: "price") as! Double,
                                 color: object.value(forKey: "color") as! String,
                                 sex: object.value(forKey: "sex") as! String,
                                 size: object.value(forKey: "size") as! String)
                    })

                    Model.instance.setTshirt(tshirt: tshirts)
                    tshirtsLoaded()
                }
            }
            
        }
    }
    
    
    
}
