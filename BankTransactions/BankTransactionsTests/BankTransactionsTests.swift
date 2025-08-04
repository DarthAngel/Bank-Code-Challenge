//
//  BankTransactionsTests.swift
//  BankTransactionsTests
//
//  Created by Angel Docampo on 26/11/21.
//

import XCTest

@testable import BankTransactions

class BankTransactionsTests: XCTestCase {

    var emptyDescriptionString: String!
    var validDate: String!
    var invalidDate: String!
    var extractedDate: String!
    var extractedTime: String!
    var inputArray = [Transaction]()
    var outputArray = [Transaction]()
    //var STExt: StringExtension!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        emptyDescriptionString = "Description not available"
        validDate = "2018-07-19T21:33:19.000Z"
        invalidDate = "07-22T13:51:12.000Z"
        extractedDate = "2018-07-19"
        extractedTime = "13:51:12"
        inputArray = [ Transaction(id: 4734, date: "2018-07-28T14:14:17.000Z", amount: 193.38, fee: -3.18, description: "Test Transaction"),
                       Transaction(id: 1442, date: "2018-07-14T16:54:27.000Z", amount: 13.40, fee: -2.18, description: "Test Transaction"),
                       Transaction(id: 1442, date: "2018-07-24T18:10:10.000Z", amount: 133.35, fee: 0, description: "Test Transaction"),
                       Transaction(id: 8396, date: "2018--11T11:31:27.000Z", amount: 60.38, fee: 0, description: "Test Transaction")]
        
        outputArray = [ Transaction(id: 4734, date: "2018-07-28T14:14:17.000Z", amount: 193.38, fee: -3.18, description: "Test Transaction"),
                       Transaction(id: 1442, date: "2018-07-14T16:54:27.000Z", amount: 13.40, fee: -2.18, description: "Test Transaction"),
                       Transaction(id: 8396, date: "2018--11T11:31:27.000Z", amount: 60.38, fee: 0, description: "Test Transaction")]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        emptyDescriptionString = nil
        validDate = nil
        invalidDate = nil
        extractedDate = nil
        extractedTime = nil
    }

    func testEmptyDesc(){
        let emptyString = ""
        let notEmptyString = "abc"
        
        let outputString = emptyString.emptyDescription()
        XCTAssertEqual(outputString, emptyDescriptionString)
        
        let outputString2 = notEmptyString.emptyDescription()
        XCTAssertEqual(outputString2, notEmptyString)
    }
    
    func testTransactionInitialization() {
        // Test with all fields
        let transaction = Transaction(id: 1, date: "2023-01-01T12:00:00.000Z", 
                                    amount: 100.0, fee: -1.99, 
                                    description: "Test Transaction")
        
        XCTAssertEqual(transaction.id, 1)
        XCTAssertEqual(transaction.date, "2023-01-01T12:00:00.000Z")
        XCTAssertEqual(transaction.amount, 100.0)
        XCTAssertEqual(transaction.fee, -1.99)
        XCTAssertEqual(transaction.description, "Test Transaction")
        
        // Test with empty description
        let emptyDescTransaction = Transaction(id: 2, date: "2023-01-01T12:00:00.000Z", 
                                             amount: 50.0, fee: 0, 
                                             description: "")
        XCTAssertEqual(emptyDescTransaction.description, "")
    }
    
    func testTransactionDecoding() throws {
        let json = """
        {
            "id": 1234,
            "date": "2023-06-15T14:30:00.000Z",
            "amount": 199.99,
            "fee": -2.50,
            "description": "Online Purchase"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let transaction = try decoder.decode(Transaction.self, from: json)
        
        XCTAssertEqual(transaction.id, 1234)
        XCTAssertEqual(transaction.date, "2023-06-15T14:30:00.000Z")
        XCTAssertEqual(transaction.amount, 199.99)
        XCTAssertEqual(transaction.fee, -2.50)
        XCTAssertEqual(transaction.description, "Online Purchase")
    }
    
    func testTransactionWithMissingFields() throws {
        let json = """
        {
            "id": 1234,
            "date": "2023-06-15T14:30:00.000Z"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let transaction = try decoder.decode(Transaction.self, from: json)
        
        // Should use default values for missing fields
        XCTAssertEqual(transaction.id, 1234)
        XCTAssertEqual(transaction.date, "2023-06-15T14:30:00.000Z")
        XCTAssertEqual(transaction.amount, 0.0)
        XCTAssertEqual(transaction.fee, 0.0)
        XCTAssertEqual(transaction.description, "")
    }
    
    func testUniqueArray() {
        let uniqueArray = inputArray.unique{$0.id}
        XCTAssertEqual(uniqueArray, outputArray)
    }
    
    func testTransactionEquality() {
        let transaction1 = Transaction(id: 1, date: "2023-01-01T12:00:00.000Z", 
                                     amount: 100.0, fee: -1.99, 
                                     description: "Test")
        let transaction2 = Transaction(id: 1, date: "2023-01-01T12:00:00.000Z", 
                                     amount: 100.0, fee: -1.99, 
                                     description: "Test")
        let transaction3 = Transaction(id: 2, date: "2023-01-01T12:00:00.000Z", 
                                     amount: 100.0, fee: -1.99, 
                                     description: "Test")
        
        // Test equality based on id (Equatable conformance)
        XCTAssertEqual(transaction1, transaction2)
        XCTAssertNotEqual(transaction1, transaction3)
    }
    

 //   func testPerformanceExample() throws {
        // This is an example of a performance test case.
 //       measure {
            // Put the code you want to measure the time of here.
  //      }
  //  }

}
