//
//  StartViewController.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/31/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var boImage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        boImage.alpha = 0
        firstLabel.alpha = 0
        secondLabel.alpha = 0
        goButton.alpha = 0
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 2, animations: {
            self.boImage.alpha = 0.7
        }) { (true) in
            self.showTitle()
        }
        
    }
    
    func showTitle() {
        UIView.animate(withDuration: 2, animations: {
            self.firstLabel.alpha = 1
        }) { (true) in
            self.showSecondLabel()
        }
    }

    
    func showSecondLabel() {
        UIView.animate(withDuration: 2, animations: {
            self.secondLabel.alpha = 1
        }) { (true) in
            self.showButton()
        }
    }
    
    func showButton() {
        UIView.animate(withDuration: 2, animations: {
            self.goButton.alpha = 1
        }) { (true) in
            
        }
    }
    
    
}
