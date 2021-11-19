//
//  TransactionListViewModel.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 19/11/21.
//

import Foundation
import Combine

class TransactionListViewModel: ObservableObject {
    
    @Published var transactions = [Transaction]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTransactions()
    }
    
    private func fetchTransactions() {
        self.cancellable = Webservice().getAllTransactions().sink(receiveCompletion: { _ in  print("Completion received")} , receiveValue: { transactionViewModels in
            print("Receiving Publication")
            self.transactions = transactionViewModels
        })
            
        }
        
}
    




