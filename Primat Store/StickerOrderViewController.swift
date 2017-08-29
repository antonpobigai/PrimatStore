//
//  StickerOrderViewController.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/28/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit
import SDWebImage

class StickerOrderViewController: MyViewController, UITextFieldDelegate {
    @IBOutlet weak var stickerImage: UIImageView!
    @IBOutlet weak var stickerTitle: UILabel!
    @IBOutlet weak var stickerSize: UILabel!
    @IBOutlet weak var countTextfield: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!

    var selectedSticker: StickerVO!
    var stickerForOrder = StickerOrder()
    var orderCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countTextfield.delegate = self

        buyButton.isEnabled = false
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        stickerTitle.text = selectedSticker.name
        stickerSize.text = selectedSticker.size
        stickerImage.sd_setImage(with: selectedSticker.picture)
    
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        performAction()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        countTextfield.resignFirstResponder()  //if desired
        performAction()
        return true
    }
    
    func performAction() {
        if countTextfield.text != "" {
            orderCount = (countTextfield.text! as NSString).integerValue
            priceLabel.text = "\(orderCount * Int(exactly: selectedSticker.price!)!)"
            buyButton.isEnabled = true
            
        } else {
            priceLabel.text = "0.0"
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func addToCArt(_ sender: Any) {
        
        if let badgeValue = tabBarController?.tabBar.items?.last?.badgeValue {
            tabBarController?.tabBar.items?.last?.badgeValue = String((Int(badgeValue) ?? 0) + 1)
        } else {
            tabBarController?.tabBar.items?.last?.badgeValue = "1"
        }
        
        if let count = countTextfield.text {
            stickerForOrder.count = orderCount
            stickerForOrder.name = selectedSticker.name
            stickerForOrder.picture = selectedSticker.picture
            stickerForOrder.price = priceLabel.text!
            stickerForOrder.size = selectedSticker.size
            Model.instance.setStickerForOrder(stickers: stickerForOrder)
            navigationController?.popViewController(animated: true)
        } else {
            return
        }
    }
}
