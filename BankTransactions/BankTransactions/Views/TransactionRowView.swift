//
//  TransactionRowView.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 19/11/21.
//

import SwiftUI



struct TransactionRowView: View {
    
    // MARK: - PROPERTIES
    
    var transaction: Transaction
    
    // MARK: - BODY
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - PREVIEW

struct TransactionRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        TransactionRowView(transaction: demoTransaction)
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
}
