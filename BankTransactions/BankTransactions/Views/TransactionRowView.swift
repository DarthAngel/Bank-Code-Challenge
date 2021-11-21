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
        VStack(spacing: 10) {
           
                HStack(){
                    Image(systemName: transaction.amount > 0 ? "plus.circle" : "minus.circle")
                        .foregroundColor(transaction.amount > 0 ? Color.green : Color.red)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                   
                    Text(transaction.description.emptyDescription())
                        .font(.caption)
                
              
                    Spacer()
            
                    Text("\(transaction.amount, specifier: "%.2f") €")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
            } //: HSTACK
            
           
            
            HStack() {
                
                
                let date = transaction.date.dateFromDate()
                let time = transaction.date.timeFromDate()
                
                Spacer()
                Text("Date: \(date) ")
                    .font(.caption)
                Text("Time: \(time) ")
                    .font(.caption)
                
                Spacer()
        
                Text("Fee: \(transaction.fee, specifier: "%.2f") €")
                    .font(.caption)
                
               
            } //: HSTACK
            
            
            
            HStack() {
                
              
                
                Spacer()
        
                Text("Total: \(transaction.amount + transaction.fee, specifier: "%.2f") €")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
               
            } //: HSTACK
            
        } //: VSTACK
    } //: BODY
}

// MARK: - PREVIEW

struct TransactionRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        TransactionRowView(transaction: demoTransaction)
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
}
