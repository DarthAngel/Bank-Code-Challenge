//
//  ContentView.swift
//  Shared
//
//  Created by Angel Docampo on 19/11/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    
    
    // MARK: - BODY
    var body: some View {
        
        VStack { // Vertical Stack with title and transaction list
            Text("Bank Transactions")
                .font(.title)
            TransactionListView()
        }

       
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
