//
//  Webservice.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 19/11/21.
//

import Foundation
import Combine

class Webservice {
    
    // We check that the URl has a valid format
    
    func getAllTransactions() -> AnyPublisher<[Transaction], Error> {
        guard let url = URL(string:"https://code-challenge-e9f47.web.app/transactions.json") else {
            fatalError("Invalid URL")
        }
        
        
        // We use datataskPublisher from the Combine framework for handeling the asynchronous response of the URLSession
        
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

