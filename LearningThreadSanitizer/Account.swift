//
//  Account.swift
//  LearningThreadSanitizer
//
//  Created by Rommel Rico on 10/23/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import Foundation

class Account {
    private var _balance: Int = 0
    var balance: Int {
        return queue.sync {
            return _balance
        }
    }
    private let queue = DispatchQueue(label: "com.rommelrico.balance-moderator")
    
    func withdraw(amount: Int, completed: @escaping () -> ()) {
        queue.async {
            let newBalance = self._balance - amount
            
            if newBalance < 0 {
                print("You don't have enough money to withdraw \(amount)")
                return
            }
            
            // Simulate processing of fraud checks
            sleep(2)
            
            self._balance = newBalance
            
            DispatchQueue.main.async {
                completed()
            }
        }
    }
    
    func deposit(amount: Int, completed: @escaping () -> ()) {
        queue.async {
            let newBalance = self._balance + amount
            self._balance = newBalance
            
            DispatchQueue.main.async {
                completed()
            }
        }
    }
    
}
