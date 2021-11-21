//
//  StringExtension.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 20/11/21.
//

import Foundation

extension String {
    
    func emptyDescription() -> String {
        if self == "" {
            return "Description not available"
        } else {
            return self
        }
    }
    
    func validateDate() -> Bool {

        let datePattern = #"^\d{4}\-\d{2}\-\d{2}T\d{2}\:\d{2}\:\d{2}\.\d{3}Z"#
        
        let result = self.range(
            of: datePattern,
            options: .regularExpression
        )


        return (result != nil)
      

    }
    
    func dateFromDate() -> String {
        return String(self.prefix(10))
        
    }
    
    func timeFromDate() -> String {
        return String(self.suffix(13).prefix(8))
    }
    
    
    
}
