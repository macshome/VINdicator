import XCTest
@testable import VINdicator

final class VINdicatorTests: XCTestCase {
    func testValidate() {
       let sut = VINdicator()
        XCTAssertTrue(sut.validateVin("11111111111111111"))
    }

    func testNoValidate() {
       let sut = VINdicator()
        XCTAssertFalse(sut.validateVin("11111111011111111"))
    }
}
