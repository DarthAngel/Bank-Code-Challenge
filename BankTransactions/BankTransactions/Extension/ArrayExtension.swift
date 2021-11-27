//
//  ArrayExtension.swift
//  BankTransactions (iOS)
//
//  Created by Angel Docampo on 21/11/21.
//

import Foundation

// This array extension removes duplicates from an array  given an expecified key

extension Array {
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered = [Element]() //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }

        return arrayOrdered
    }
}




