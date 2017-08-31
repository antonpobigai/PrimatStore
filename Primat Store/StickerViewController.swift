//
//  StickerViewController.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/27/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit
import SDWebImage

class StickerViewController:MyViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        loading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func refreshTable(_ sender: Any) {
        loading()
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
        cell.stickerSize.text = sticker?.size
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let x: CGFloat = 1.0
        let y: CGFloat = 0.0
        let z: CGFloat = 0.0
        
        var rotation = CATransform3DMakeRotation(CGFloat(Double.pi/2), x, y, z)
        
        rotation.m34 = 1 / -500
        cell.contentView.layer.transform = rotation
        cell.contentView.layer.anchorPoint = CGPoint(x: 0, y: 0)
        
        UIView.beginAnimations("rotation", context: nil)
        UIView.setAnimationDuration(1)
        
        cell.contentView.layer.transform = CATransform3DIdentity
        
        UIView.commitAnimations()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as UIViewController
        if segue.identifier == "StickerSegue" {
            let cell = sender as! StickerTableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let sticker = Model.instance.stickers![indexPath!.row]
            let detailsViewController = destinationVC as! StickerOrderViewController
            detailsViewController.selectedSticker = sticker
        }
    }
    
    func loading() {
        if Reachability.isConnectedToNetwork() == true {
            SwiftSpinner.show("Підгружаємо стікери")
            Model.instance.loadAllStickers(loaded: tableView.reloadData)
        } else {
            AlertDialog.showAlert("Error", message: "Провірте підключення до інтернету", viewController: self)
        }
    }
    
}
