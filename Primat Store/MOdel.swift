//
//  MOdel.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/27/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import Foundation

class Model {
   
    static var instance = Model()
    
    private (set) var stickers: [StickerVO]? = []
    private (set) var tshirts: [TShirtVO]? = []


    func loadAllStickers(loaded: @escaping () -> Void) {
        DataLoader().requestStickers(stickersLoaded: loaded)
    }
    
    func loadAllTshirts(loaded: @escaping () -> Void) {
        DataLoader().requestTshirts(tshirtsLoaded: loaded)
    }
    
    
    func setStickers(stickers: [StickerVO]) {
        self.stickers = stickers
    }
    
    func setTshirt(tshirt: [TShirtVO]) {
        self.tshirts = tshirt
    }
    
}
