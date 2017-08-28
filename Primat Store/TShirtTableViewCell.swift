//
//  TShirtTableViewCell.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/28/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit

class TShirtTableViewCell: UITableViewCell {
    @IBOutlet weak var tshirtImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sizesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
