//
//  SwiftyOnceTests.swift
//  SwiftyOnceTests
//
//  Created by Kamil Tustanowski on 20.01.2017.
//  Copyright © 2017 ktustanowski. All rights reserved.
//

import XCTest
@testable import SwiftyOnce

class SwiftyOnceTests: XCTestCase {
    
    var concurrentQueue: DispatchQueue!
    
    override func setUp() {
        super.setUp()
        concurrentQueue = DispatchQueue(label: "concurrent.queue", qos: .utility, attributes: .concurrent)
    }
    
    func testThatBlockIsExecutedOnlyOnce() {
        let dispatchOnceExpectation = expectation(description: "Dispatch once")
        var counter = 0
        
        /* Fulfill expectation before waitForExpectations timeouts */
        fulfill(dispatchOnceExpectation, deadline: .now() + 2)
        
        for _ in 0...100 {
            DispatchQueue.global().async {
                DispatchQueue.once(token: "someToken") {
                    counter += 1
                }
            }

            concurrentQueue.async {
                DispatchQueue.once(token: "someToken") {
                    counter += 1
                }
            }
        }
        
        waitForExpectations(timeout: 2.5, handler: nil)
        
        XCTAssertEqual(counter, 1, "")
    }
}

extension SwiftyOnceTests {
    
    func fulfill(_ expectation: XCTestExpectation, deadline: DispatchTime) {
        DispatchQueue.global().asyncAfter(deadline: deadline) {
            DispatchQueue.main.async {
                expectation.fulfill()
            }
        }
    }
    
}
