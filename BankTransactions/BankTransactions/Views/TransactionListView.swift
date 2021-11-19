//
//  TransactionListView.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 19/11/21.
//

import SwiftUI



struct TransactionListView: View {
    
    // MARK: - PROPERTIES
    
    @ObservedObject private var transactionListVM = TransactionListViewModel()
    
    // MARK: - BODY
    
    var body: some View {
        List(self.transactionListVM.transactions){ transactionVM in
            Text("\(transactionVM.description)")
            
        }
    }
}

// MARK: - PREVIEW

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
