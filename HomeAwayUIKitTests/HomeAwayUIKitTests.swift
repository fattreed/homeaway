//
//  HomeAwayUIKitTests.swift
//  HomeAwayUIKitTests
//
//  Created by matty on 3/7/20.
//  Copyright © 2020 matty. All rights reserved.
//

import XCTest
@testable import HomeAwayUIKit

class HomeAwayUIKitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLiveSearch() {
        let exp = expectation(description: "got events")
        API.search(with: "Chicago Bulls") { events in
            exp.fulfill()
            XCTAssertFalse(events.isEmpty)
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
