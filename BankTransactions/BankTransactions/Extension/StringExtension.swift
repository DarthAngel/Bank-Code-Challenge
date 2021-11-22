//
//  StringExtension.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 20/11/21.
//

import Foundation

extension String {
    
    // Replaces an empty description with a placeholder
    
    func emptyDescription() -> String {
        if self == "" {
            return "Description not available"
        } else {
            return self
        }
    }
    
    // Tests if the date string has the correct format using regular expressions
    
    func validateDate() -> Bool {

        let datePattern = #"^\d{4}\-\d{2}\-\d{2}T\d{2}\:\d{2}\:\d{2}\.\d{3}Z"#
        
        let result = self.range(
            of: datePattern,
            options: .regularExpression
        )


        return (result != nil)
      

    }
    
    // Extracts a date string from the date/time string received from the server
    
    func dateFromDate() -> String {
        return String(self.prefix(10))
        
    }
    
    // Extracts a time string from the date/time string received from the server
    
    func timeFromDate() -> String {
        return String(self.suffix(13).prefix(8))
    }
    
    
    
}


