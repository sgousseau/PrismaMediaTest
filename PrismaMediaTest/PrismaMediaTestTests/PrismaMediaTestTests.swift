//
//  PrismaMediaTestTests.swift
//  PrismaMediaTestTests
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import XCTest
@testable import PrismaMediaTest

class PrismaMediaTestTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testApiAndStorage() {
        let exp = expectation(description: "exp")
        
        var manager = UserManager()
        var user: User?
        
        manager.get(completion: { (result) in
            user = result
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertNotNil(user)
        
        manager = UserManager()
        XCTAssertNotNil(manager.user)
        XCTAssertTrue(user! == manager.user!)
    }
}

extension User: Equatable {
    public static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}
