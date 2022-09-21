import XCTest
@testable import VINdicator

final class VINdicatorTests: XCTestCase {
    func testValidate() {
       let sut = VINdicator()
        XCTAssertTrue(try sut.validateVin("11111111111111111"))
    }

    func testNoValidate() {
       let sut = VINdicator()
        XCTAssertThrowsError(try sut.validateVin("11111111011111111")) { error in
            XCTAssertEqual(error as! VindicatorError, VindicatorError.invalidVin)
        }
    }

    func testBadLookup() async throws {
       let sut = VINdicator()
        do {
            try await sut.lookupVin("11111111011111111")
        } catch {
            XCTAssertEqual(error as! VindicatorError, VindicatorError.invalidVin)
        }
    }

    func testVINPerformance() throws {
        let sut = VINdicator()
        self.measure {
           _ = try? sut.validateVin("11111111111111111")
        }
    }

    func testLookup() async throws {
        let sut = VINdicator()
        try await sut.lookupVin("WBA3A5G59DNP26082")
    }
}
