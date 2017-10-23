//
//  Account.swift
//  LearningThreadSanitizer
//
//  Created by Rommel Rico on 10/23/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import Foundation

class Account {
    var balance: Int = 0
    
    func withdraw(amount: Int, completed: @escaping () -> ()) {
        DispatchQueue(label: "com.rommelrico.balance-moderator").async {
            let newBalance = self.balance - amount
            
            if newBalance < 0 {
                print("You don't have enough money to withdraw \(amount)")
                return
            }
            
            // Simulate processing of fraud checks
            sleep(2)
            
            self.balance = newBalance
            
            DispatchQueue.main.async {
                completed()
            }
        }
    }
    
    func deposit(amount: Int, completed: () -> ()) {
        let newBalance = self.balance + amount
        self.balance = newBalance
        
        completed()
    }
    
}
