//
//  Webservice.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 19/11/21.
//

import Foundation
import Combine

class Webservice {
    
    func getAllTransactions() -> AnyPublisher<[Transaction], Error> {
        guard let url = URL(string:"https://code-challenge-e9f47.web.app/transactions.json") else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .print()
            .print("Publishing: ")
            .decode(type: [Transaction].self , decoder: JSONDecoder())
            .print()
            .eraseToAnyPublisher()

        
    }
    
    
}

