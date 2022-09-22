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

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = Validator()
    }

    override func tearDownWithError() throws {
        self.sut = nil
        try super.tearDownWithError()
    }
    
    func testTooLong() throws {
        XCTAssertThrowsError(try sut.validate(tooLong)) { error in
            XCTAssertEqual(error as! VindicatorError, VindicatorError.vinTooLong)
        }
    }

    func testTooShort() throws {
        XCTAssertThrowsError(try sut.validate(tooShort)) { error in
            XCTAssertEqual(error as! VindicatorError, VindicatorError.vinTooShort)
        }
    }

    func testValidVIN() throws {
        XCTAssertNoThrow(try sut.validate(valid))
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

    func testXDigit() {
        let result = sut.calculateCheckDigit(xCheckDigit)
        let checkdigit = xCheckDigit[xCheckDigit.index(xCheckDigit.startIndex, offsetBy: 8)]
        XCTAssertEqual(result, String(checkdigit))
    }

    func testLowerCaseVIN() throws {
        try sut.validate(lowerCase)
    }
}
