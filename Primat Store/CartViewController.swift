//
//  CartViewController.swift
//  Primat Store
//
//  Created by Pavlo Kharambura on 8/28/17.
//  Copyright © 2017 Anton Pobigai. All rights reserved.
//

import UIKit
import SDWebImage
import MessageUI

class CartViewController: MyViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
 
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!

    var sections = ["T-Shirts", "Stickers"]
    var t_shirts: [TshirtOrder] = []
    var s_tickers: [StickerOrder] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Reachability.isConnectedToNetwork() == false {
            mailButton.isEnabled = false
            clearButton.isEnabled = false
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

        t_shirts = Model.instance.tshirtOrder ?? []
        s_tickers = Model.instance.stickersOrder ?? []
        
        if Reachability.isConnectedToNetwork() == false {
            mailButton.isEnabled = false
            clearButton.isEnabled = false
        } else {
            if t_shirts.count == 0 && s_tickers.count == 0 {
                mailButton.isEnabled = false
                clearButton.isEnabled = false
            } else {
                mailButton.isEnabled = true
                clearButton.isEnabled = true
            }
        }
        
        tableView.reloadData()
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
            cell.sizeLabel.text = "Розмір: \(item.size ?? "L")"
            
        } else if sectionIndex == 1 {
            let item = s_tickers[rowIndex]
            cell.itemTitle.text = item.name
            cell.itemImage.sd_setImage(with: item.picture)
            cell.itemsCount.text = "\(item.count ?? 0)"
            cell.itemsPrice.text = "\(item.price ?? "0")"
            cell.sizeLabel.text = "Розмір: \(item.size ?? "0x0")"
        }
        return cell
    }
    
    func orderText() -> [String] {
        var stickerString = ""
        var t_shirtSrting = ""
        var counter = 1
        for orderItem in s_tickers {
            stickerString.append("\(counter)) Стікер: \(orderItem.name ?? "nil") Кількість: \(orderItem.count ?? 0) Ціна: \(orderItem.price ?? "0") ")
            counter += 1
        }
        
        for orderItem in t_shirts {
            t_shirtSrting.append("\(counter)) Футболка: \(orderItem.nameOfPrint ?? "nil") Колір:\(orderItem.color ?? "nil") Кількість:\(orderItem.count ?? 0) Ціна:\(orderItem.price ?? "0") Розмір:\(orderItem.size ?? "nil?") Стать:\(orderItem.sex ?? "nil")  ")
        }
        
        return [stickerString, t_shirtSrting]
    }

    func configureMailComtroller() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["Antonpobigai@gmail.com", "pilipenko.dmitryi@gmail.com", "pasha.harambura@gmail.com"])
        mailComposerVC.setSubject("Order")
        mailComposerVC.setMessageBody("\(orderText())", isHTML: false)
        
        return mailComposerVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        Model.instance.orderSended()
        tabBarController?.tabBar.items?.last?.badgeValue = nil
    }
    
    @IBAction func clearCart(_ sender: Any) {
        
        tabBarController?.tabBar.items?.last?.badgeValue = nil
        
        Model.instance.orderSended()
        t_shirts = Model.instance.tshirtOrder ?? []
        s_tickers = Model.instance.stickersOrder ?? []
        mailButton.isEnabled = false
        clearButton.isEnabled = false
        tableView.reloadData()
    }

    @IBAction func sendEmail(_ sender: Any) {
        let mailComposerViewConroller = configureMailComtroller()
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposerViewConroller, animated: true, completion: nil)
        } else {
            print("ERROR")
        }
    }

}
