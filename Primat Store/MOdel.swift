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
    private (set) var stickersOrder: [StickerOrder]? = []
    private (set) var tshirtOrder: [TshirtOrder]? = []

    func loadAllStickers(loaded: @escaping () -> Void) {
        DataLoader().requestStickers(stickersLoaded: loaded)
    }
    
    func loadAllTshirts(loaded: @escaping () -> Void) {
        DataLoader().requestTshirts(tshirtsLoaded: loaded)
    }
    
    func setStickerForOrder(stickers: StickerOrder) {
        self.stickersOrder?.append(stickers)
    }
    
    func setTshirtsFOrOrder(tshirt: TshirtOrder) {
        self.tshirtOrder?.append(tshirt)
    }
    
    func setStickers(stickers: [StickerVO]) {
        self.stickers = stickers
    }
    
    func setTshirt(tshirt: [TShirtVO]) {
        self.tshirts = tshirt
    }
    
}
