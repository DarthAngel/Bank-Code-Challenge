//
//  Transaction.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 19/11/21.
//

import SwiftUI


let demoTransaction = Transaction(id: 4734, date: "2018-07-28T14:14:17.000Z", amount: -193.38, fee: -3.18, description: "Test Transaction)")

struct Transaction: Codable, Identifiable {
    
    let id: Int 
    let date: String
    let amount: Double
    let fee: Double
    let description: String
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case date = "date"
        case amount = "amount"
        case fee = "fee"
        case description = "description"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        date = try values.decodeIfPresent(String.self, forKey: .date) ?? ""
        amount = try values.decodeIfPresent(Double.self, forKey: .amount) ?? 0.0
        fee = try values.decodeIfPresent(Double.self, forKey: .fee) ??  0.0
        description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
    }
    
    init(id: Int, date: String, amount: Double, fee: Double, description: String){
        self.id = id
        self.date = date
        self.amount = amount
        self.fee = fee
        self.description = description
    }
    
    
}
