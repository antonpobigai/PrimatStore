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

    var selectedTshirt: TShirtVO!
    var tshirtForOrder = TshirtOrder()
    var orderCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countTextField.delegate = self
        self.sizeTextfield.delegate = self
        self.sexTextfield.delegate = self
        
        tshirtTitleLabel.text = selectedTshirt.nameOfPrint
        tshirtImage.sd_setImage(with: selectedTshirt.picture)
        
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
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func addToCArt(_ sender: Any) {
        if let count = countTextField.text {
            tshirtForOrder.color = selectedTshirt.color
            tshirtForOrder.count = orderCount
            tshirtForOrder.nameOfPrint = selectedTshirt.nameOfPrint
            tshirtForOrder.picture = selectedTshirt.picture
            tshirtForOrder.price = priceLabel.text
            tshirtForOrder.sex = sexTextfield.text
            tshirtForOrder.size = sizeTextfield.text
            Model.instance.setTshirtsFOrOrder(tshirt: tshirtForOrder)
        } else {
            return
        }
    }
    
}
