//
//  TransactionListViewModel.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 19/11/21.
//

import Foundation
import Combine


// View Model for the transation list view. transations array is @Published for automatic update of the list view.

class TransactionListViewModel: ObservableObject {
    
    @Published var transactions = [Transaction]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTransactions()
    }
    
    // This view model is initializated sinking to the  Webservice getallTransactions publisher using Combine Framework
    
    private func fetchTransactions() {
        
        self.cancellable = Webservice().getAllTransactions().sink(receiveCompletion: { _ in  print("Completion received")} , receiveValue: { transactionViewModels in
            print("Receiving Publication")
            var auxTransactions = transactionViewModels.filter{ $0.date.validateDate()} // We remove transactions with invalid format date field
            auxTransactions = auxTransactions.sorted(by: {$0.date > $1.date}) // We order transactions by date
            let uniqueTransactions = auxTransactions.unique{$0.id}
            // We remove trasnactions with duplicated id (this functions retains the first appearin id, since we ha ordered previously this array date, we keep the most recent trasnaction with the repeated id.
            self.transactions = uniqueTransactions
        })
            
        }
        
}
    




