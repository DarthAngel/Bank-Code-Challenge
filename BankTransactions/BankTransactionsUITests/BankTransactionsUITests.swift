//
//  BankTransactionsUITests.swift
//  BankTransactionsUITests
//
//  Created by Angel Docampo on 26/11/21.
//

import XCTest

class BankTransactionsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTransactionListAppears() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
        // Verify the main screen title is displayed
        XCTAssertTrue(app.staticTexts["Bank Transactions"].exists)
        

    }
    

    
    func testTransactionFiltering() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Assuming there's a search bar for filtering
        let searchField = app.searchFields["Search transactions"]
        if searchField.exists {
            searchField.tap()
            searchField.typeText("Test")
            
            // Verify the list updates with filtered results
            let transactionList = app.tables["transactionList"]
            XCTAssertTrue(transactionList.cells.count > 0)
            
            // Clear search
            let clearButton = app.buttons["Clear text"]
            if clearButton.exists {
                clearButton.tap()
            }
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
