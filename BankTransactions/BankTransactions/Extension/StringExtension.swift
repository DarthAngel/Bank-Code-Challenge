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

                let fromDateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        

               let fromDateFormatter = DateFormatter()
               fromDateFormatter.dateFormat = fromDateFormat

               if fromDateFormatter.date(from: self) != nil {

                   return true
               }
               
               return false
        
        

    }
    
    // Extracts a date string from the date/time string received from the server
    
    func dateFromDate() -> String {
        return convert(dateString: self, fromDateFormat: "yyyy-MM-dd'T'HH:mm:ss.sssZ", toDateFormat: "yyyy-MM-dd")!
       }


    // Extracts a time string from the date/time string received from the server
    
    func timeFromDate() -> String {
        return convert(dateString: self, fromDateFormat: "yyyy-MM-dd'T'HH:mm:ss.sssZ", toDateFormat: "HH:mm:ss")!
    }
    
    
    func convert(dateString: String, fromDateFormat: String, toDateFormat: String) -> String? {

           let fromDateFormatter = DateFormatter()
           fromDateFormatter.dateFormat = fromDateFormat

           if let fromDateObject = fromDateFormatter.date(from: dateString) {

               let toDateFormatter = DateFormatter()
               toDateFormatter.dateFormat = toDateFormat

               let newDateString = toDateFormatter.string(from: fromDateObject)
               return newDateString
           }
           
           return "Invalid"
       }
    
    
  
    
    
    
    
    
}


