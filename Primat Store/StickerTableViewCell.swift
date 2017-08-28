//
//  StickerTableViewCell.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/28/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit

class StickerTableViewCell: UITableViewCell {
    @IBOutlet weak var stickerImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stickerSize: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
