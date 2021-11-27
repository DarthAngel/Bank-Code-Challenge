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
    
    func testUniqueArray(){
        
        let uniqueArray = inputArray.unique{$0.id}
        XCTAssertEqual(uniqueArray, outputArray)
        
    }
    

 //   func testPerformanceExample() throws {
        // This is an example of a performance test case.
 //       measure {
            // Put the code you want to measure the time of here.
  //      }
  //  }

}
