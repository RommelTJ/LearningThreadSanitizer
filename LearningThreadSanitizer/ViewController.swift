//
//  ViewController.swift
//  LearningThreadSanitizer
//
//  Created by Rommel Rico on 10/23/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var balanceLabel: UILabel!
    
    let account = Account()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBalanceLabel()
    }
    
    @IBAction func withdraw(_ sender: UIButton) {
        self.account.withdraw(amount: 100, completed: updateBalanceLabel)
    }
    
    @IBAction func deposit(_ sender: UIButton) {
        self.account.deposit(amount: 100, completed: updateBalanceLabel)
    }
    
    func updateBalanceLabel() {
        balanceLabel.text = "Balance: $\(account.balance)"
    }

}

