//
//  UpstoxAppTests.swift
//  UpstoxAppTests
//
//  Created by Sandeep Negi on 11/11/24.
//

import XCTest
@testable import UpstoxApp

final class UpstoxAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPositiveResponse() throws {
        let cyptoListViewModel = CyptoListViewModel(apiManager: MockAPIManager(response: successResponse))
        
        let expectation = self.expectation(description: "Success Unit Test")
        
        
        cyptoListViewModel.fetch(completion: { itemList in
            XCTAssertNotNil(itemList, "Test Positive Response: Failed List null")
            
            let firstItem = itemList?.first
            XCTAssertNotNil(firstItem, "Test Positive Response: Failed first item null")
            
            XCTAssertNotNil(firstItem?.name, "Test Positive Response: Name null")
            XCTAssertNotNil(firstItem?.symbol, "Test Positive Response: Symbol null ")
            XCTAssertNotNil(firstItem?.isNew, "Test Positive Response: isNew null")
            XCTAssertNotNil(firstItem?.isActive, "Test Positive Response: isActive null")
            XCTAssertNotNil(firstItem?.type, "Test Positive Response: type null")
            
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }
    
    func testEmptyResponse() throws {
        let cyptoListViewModel = CyptoListViewModel(apiManager: MockAPIManager(response: emptyResponse))
        
        let expectation = self.expectation(description: "Empty Unit Test")
        
        cyptoListViewModel.fetch(completion: { itemList in
            XCTAssertTrue(itemList?.isEmpty ?? true, "Test Empty Response: Crypto List not empty")
            XCTAssertTrue(itemList?.first?.name.isEmpty ?? true, "Test Empty Response: Crypto List item not empty")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }

    func testNilResponse() throws {
        let cyptoListViewModel = CyptoListViewModel(apiManager: MockAPIManager(response: nilResponse))
        
        let expectation = self.expectation(description: "Nil Unit Test")
        
        cyptoListViewModel.fetch(completion: { itemList in
            XCTAssertTrue(itemList?.isEmpty ?? true, "Test Nil Response: Crypto List not Nil")
            XCTAssertNil(itemList?.first, "Test Nil Response: Crypto List item not Nil")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }

}
