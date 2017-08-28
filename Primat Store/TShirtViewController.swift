//
//  TShirtViewController.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/27/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit
import SDWebImage

class TShirtViewController: MyViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        Model.instance.loadAllTshirts(loaded: tableView.reloadData)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.instance.tshirts?.count ?? 0
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tshirt") as! TShirtTableViewCell
        let index = indexPath.row
        let tshirt = Model.instance.tshirts?[index]
        
        if let imageUrl = tshirt?.picture {
            cell.tshirtImage.sd_setImage(with: imageUrl)
        }
        cell.title.text = tshirt?.nameOfPrint
        cell.priceLabel.text = "\(tshirt?.price ?? 0.0)"
        cell.sizesLabel.text = tshirt?.size
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as UIViewController
        if segue.identifier == "TshirtSegue" {
            let cell = sender as! TShirtTableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let tshirt = Model.instance.tshirts![indexPath!.row]
            let detailsViewController = destinationVC as! TshirtOrderViewController
            detailsViewController.selectedTshirt = tshirt
        }
    }
    
}
