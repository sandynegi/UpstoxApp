//
//  UpstoxAppUITests.swift
//  UpstoxAppUITests
//
//  Created by Sandeep Negi on 11/11/24.
//

import XCTest

final class UpstoxAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    func testHappyFlow() throws {
        
        let app = XCUIApplication()
        app.launch()
        wait()
        
        let tablesQuery = app.tables
        
        wait()
        let tableView = tablesQuery.containing(.table, identifier: TestAppConstants.Accessibility.tvCryptoTable)
        XCTAssertTrue(tableView.cells.count > 0, "Crypto list data available failed")
        
        wait(interval: 2)
        
        app.swipeUp()
        wait(interval: 2)
        
        XCUIApplication().navigationBars[TestAppConstants.Accessibility.navigationBar].buttons[TestAppConstants.Accessibility.searchFilterBarButton].tap()
        
        
        wait(interval: 2)
        
        let cryptoCollectionView = app.collectionViews[TestAppConstants.Accessibility.cryptoCollectionView]
        
        XCTAssertNotNil(cryptoCollectionView, "Crypto CollectionView not available on UI")
        
        // Selection
        for i in 0..<5 {
            let cellIndex = TestAppConstants.Accessibility.cryptoSearchFilterOption + "\(i)"
            cryptoCollectionView.cells[cellIndex].tap()
            wait(interval: 2)
        }
        
        // De-selection
        for i in 0..<5 {
            let cellIndex = TestAppConstants.Accessibility.cryptoSearchFilterOption + "\(i)"
            cryptoCollectionView.cells[cellIndex].tap()
            wait(interval: 2)
        }
        
        XCUIApplication().navigationBars[TestAppConstants.Accessibility.navigationBar].buttons[TestAppConstants.Accessibility.searchFilterBarButton].tap()
        
        let cryptoCollectionViewTest = app.collectionViews[TestAppConstants.Accessibility.cryptoCollectionView]
        XCTAssertFalse(cryptoCollectionViewTest.exists, "Crypto CollectionView Still active on UI")
    }
    
    func wait(interval: TimeInterval = 2) {
        let exp = expectation(description: "UI_Test_Case_Waiter")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 1)
    }
}
