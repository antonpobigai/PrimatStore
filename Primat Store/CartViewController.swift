//
//  CartViewController.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/28/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit
import SDWebImage

class CartViewController: MyViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!

    let sections = ["T-Shirts", "Stickers"]
    var t_shirts: [TshirtOrder] = []
    var s_tickers: [StickerOrder] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {

        t_shirts = Model.instance.tshirtOrder ?? []
        s_tickers = Model.instance.stickersOrder ?? []
        
        tableView.reloadData()
        
        print("MyOrder T-Shirts:\(t_shirts)")
        print("MyOrder Stickers:\(s_tickers)")
    }
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       var my_count = 0
        
        if section == 0 {
            my_count = t_shirts.count
        } else if section == 1 {
            my_count = s_tickers.count
        }
        return my_count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cart") as! CartTableViewCell
        let sectionIndex = indexPath.section
        let rowIndex = indexPath.row
        
        if sectionIndex == 0 {
            let item = t_shirts[rowIndex]
            cell.itemTitle.text = item.nameOfPrint
            cell.itemImage.sd_setImage(with: item.picture)
            cell.itemsCount.text = "\(item.count ?? 0)"
            cell.itemsPrice.text = "\(item.price ?? "0")"
            
        } else if sectionIndex == 1 {
            let item = s_tickers[rowIndex]
            cell.itemTitle.text = item.name
            cell.itemImage.sd_setImage(with: item.picture)
            cell.itemsCount.text = "\(item.count ?? 0)"
            cell.itemsPrice.text = "\(item.price ?? "0")"
        }
        return cell
    }

    
    
}
