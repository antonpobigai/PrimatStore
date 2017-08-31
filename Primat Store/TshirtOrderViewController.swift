//
//  TshirtOrderViewController.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/28/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit
import SDWebImage

class TshirtOrderViewController: MyViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tshirtTitleLabel: UILabel!
    @IBOutlet weak var tshirtImage: UIImageView!
    @IBOutlet weak var sizeTextfield: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    @IBOutlet weak var sexTextfield: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!

    var selectedTshirt: TShirtVO!
    var tshirtForOrder = TshirtOrder()
    var orderCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyButton.isEnabled = false
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TshirtOrderViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.countTextField.delegate = self
        self.sizeTextfield.delegate = self
        self.sexTextfield.delegate = self
        
        tshirtTitleLabel.text = selectedTshirt.nameOfPrint
        tshirtImage.sd_setImage(with: selectedTshirt.picture)
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        performAction()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if countTextField.resignFirstResponder() || sizeTextfield.resignFirstResponder() || sexTextfield.resignFirstResponder() {   //if desired
            performAction()
        }
        return true
    }
    
    func performAction() {
        if countTextField.text != "" {
            orderCount = (countTextField.text! as NSString).integerValue
            priceLabel.text = "\(orderCount * Int(exactly: selectedTshirt.price)!)"
        } else {
            priceLabel.text = "0.0"
        }
        
        if countTextField.text != "" && sizeTextfield.text != "" && sexTextfield.text != "" {
            buyButton.isEnabled = true
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
        
        if countTextField.text != nil {
            tshirtForOrder.color = selectedTshirt.color
            tshirtForOrder.count = orderCount
            tshirtForOrder.nameOfPrint = selectedTshirt.nameOfPrint
            tshirtForOrder.picture = selectedTshirt.picture
            tshirtForOrder.price = priceLabel.text
            tshirtForOrder.sex = sexTextfield.text
            tshirtForOrder.size = sizeTextfield.text
            Model.instance.setTshirtsFOrOrder(tshirt: tshirtForOrder)
            navigationController?.popViewController(animated: true)
        } else {
            return
        }
    }
    
}
