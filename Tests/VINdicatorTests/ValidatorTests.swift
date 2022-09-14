//
//  File.swift
//  
//
//  Created by Josh Wisenbaker on 9/13/22.
//

import XCTest
@testable import VINdicator

final class ValidatorTests: XCTestCase {

    var sut: Validator!

    let tooLong = "111111111111111111"
    let tooShort = "1111111111111111"
    let valid = "11111111111111111"
    let preTrans = "WBA3A5G59DNP26082"
    let postTrans = [6, 2, 1, 3, 1, 5, 7, 5, 9, 4, 5, 7, 2, 6, 0, 8, 2]

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = Validator()
    }

    override func tearDownWithError() throws {
        self.sut = nil
        try super.tearDownWithError()
    }
    
    func testTooLong() {
        let result = sut.validate(tooLong)
        XCTAssertFalse(result)
    }

    func testTooShort() {
        let result = sut.validate(tooShort)
        XCTAssertFalse(result)
    }

    func testValidVIN() {
        let result = sut.validate(valid)
        XCTAssertTrue(result)
    }

    func testTransliteration() {
        let result = sut.transliterate(preTrans)
        XCTAssertEqual(result, postTrans, "Transliteration failed.")
    }

    func testCheckDigit() {
        let result = sut.calculateCheckDigit(preTrans)
        let checkdigit = preTrans[preTrans.index(preTrans.startIndex, offsetBy: 8)]
        XCTAssertEqual(result, String(checkdigit))
    }
}
