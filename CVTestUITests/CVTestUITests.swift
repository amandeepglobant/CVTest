//
//  CVTestUITests.swift
//  CVTestUITests
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import XCTest
@testable import CVTest

class CVTestUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: Test methods
    // Method to check tableview headers text
    func testHeaderTitle() {
        XCTAssertTrue(app.staticTexts["Employee name"].exists)
        XCTAssertTrue(app.staticTexts["Employee position"].exists)
        XCTAssertTrue(app.staticTexts["Career Summary"].exists)
        XCTAssertTrue(app.staticTexts["Summary of Qualifications"].exists)
        XCTAssertTrue(app.staticTexts["Languages"].exists)
        XCTAssertTrue(app.staticTexts["Career History"].exists)
        XCTAssertTrue(app.staticTexts["Education"].exists)
    }
    
    // Method to test tableview's pull to refresh functionality
    func testPullToRefresh() {
        let firstCell = app.staticTexts["Employee name"]
        let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 12))
        start.press(forDuration: 0.1, thenDragTo: finish)
    }
    
    // Method to test tableview's number of sections
    func testNumberOfSections() {
        let numberOfCells = app.tables.cells.count
        XCTAssertEqual(numberOfCells, 13)
    }
}
