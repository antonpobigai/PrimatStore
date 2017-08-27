//
//  StickerViewController.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/27/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit
import SDWebImage

class StickerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        Model.instance.loadAllStickers(loaded: tableView.reloadData)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.instance.stickers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sticker") as! StickerTableViewCell
        let index = indexPath.row
        let sticker = Model.instance.stickers?[index]
        
        if let imageUrl = sticker?.picture {
            cell.stickerImage.sd_setImage(with: imageUrl)
        }
        cell.title.text = sticker?.name
        cell.priceLabel.text = "\(sticker?.price ?? 0.0)"
        
        return cell
    }
    
}
