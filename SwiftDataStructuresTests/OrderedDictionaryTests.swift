//
//  OrderedDictionaryTests.swift
//  SwiftDataStructures
//
//  Created by Tim Ekl on 3/29/16.
//  Copyright © 2016 Tim Ekl. All rights reserved.
//

import Foundation
import XCTest

@testable import SwiftDataStructures

class OrderedDictionaryTests: XCTestCase {
    
    func testEmptyOrderedDictionary() {
        let od = OrderedDictionary<String, Int>()
        XCTAssertEqual(od.count, 0)
        XCTAssertEqual(od.keys, [])
        XCTAssertEqual(od.values, [:])
    }
    
    func testAddOrderedDictionaryElements() {
        var od = OrderedDictionary<String, Int>()
        od["foo"] = 1
        od["bar"] = 2
        
        XCTAssertEqual(od.count, 2)
        
        // Lookup by key
        XCTAssertEqual(od["foo"], 1)
        XCTAssertEqual(od["bar"], 2)
        XCTAssertEqual(od.keys, ["foo", "bar"])
        
        // Lookup by index
        XCTAssertEqual(od[0], 1)
        XCTAssertEqual(od[1], 2)
    }
    
}
