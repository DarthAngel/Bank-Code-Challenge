//
//  Transaction.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 19/11/21.
//

import SwiftUI

struct Transaction: Codable, Identifiable {
    
    let id: Int
    let date: String
    let amount: Double
    let fee: Double
    let description: String
    
}
