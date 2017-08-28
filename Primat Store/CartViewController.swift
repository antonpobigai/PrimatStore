//
//  CartViewController.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/28/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(Model.instance.stickersOrder ?? "error")
    }

    
    

}
