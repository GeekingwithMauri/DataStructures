import DataStructures
import XCTest

final class PascalTriangleTests: XCTestCase {
    func test_triangleIsProperlyBuilt_for2ndDegree() {
        // Given
        let resultingBase = PascalTriangle.build(for: 2)

        // Verify
        XCTAssertEqual(resultingBase, [1, 2, 1], "Pascal's triangle isn't properly built")
    }

    func test_triangleIsProperlyBuilt_for7ndDegree() {
        // Given
        let resultingBase = PascalTriangle.build(for: 7)

        // Verify
        XCTAssertEqual(resultingBase, [1, 7, 21, 35, 35, 21, 7, 1], "Pascal's triangle isn't properly built")
    }
}
