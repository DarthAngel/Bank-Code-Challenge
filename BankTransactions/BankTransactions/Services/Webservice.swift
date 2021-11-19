//
//  Webservice.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 19/11/21.
//

import Foundation
import Combine


func getAllTransactions() -> AnyPublisher<[Transaction], Error> {
    guard let url = URL(string:"https://code-challenge-e9f47.web.app/transactions.json") else {
        fatalError("Invalid URL")
    }
    
    
    
}
