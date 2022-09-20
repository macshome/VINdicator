//
//  LookupTests.swift
//  
//
//  Created by Josh Wisenbaker on 9/14/22.
//

import XCTest
@testable import VINdicator

final class LookupTests: XCTestCase {

    var sut: Lookup!

    override func setUpWithError() throws {
        self.sut = Lookup()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        self.sut = nil
        try super.tearDownWithError()
    }

    func testDecode() throws {
        let testData = Data(base64Encoded: testBase64Data)!
        let result = try sut.decodeJSON(testData)
        XCTAssertEqual(result, testVehicle)
    }

}
