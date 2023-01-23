@testable import DataStructures
import XCTest

final class MinHeapTests: XCTestCase {
    private func preLoadHeap(upperBound: Int = 100, iterations: Int = 15) -> MinHeap {
        let sut = MinHeap()

        (1...iterations).forEach { _ in
            sut.insert(Int.random(in: 1...upperBound))
        }

        return sut
    }

    func test_guaranteeElementsAreProperlyCounted() {
        // Given
        let iterations = 5

        // When
        let sut = preLoadHeap(iterations: iterations)

        // Verify
        XCTAssertEqual(sut.count, iterations, "Internal count isn't working as expected")
    }

    func test_guaranteeElementsAreProperlyDiscounted() {
        // Given
        let sut = preLoadHeap()

        // When
        while !sut.isEmpty {
            _ = sut.extractMin()
        }

        // Verify
        XCTAssertEqual(sut.count, 0, "Internal count isn't discounting elements as expected")
    }

    func test_guaranteeMinHeapExtraction_alwaysReturnsTheSmallestValue() throws {
        // Given
        var i = 1
        let sut = preLoadHeap()

        // When
        var smallest = try XCTUnwrap(sut.extractMin(),
                                     "Could not retrieve the first smallest number")

        // Verify
        while !sut.isEmpty {
            let currentMin = try XCTUnwrap(sut.extractMin(),
                                           "Could not retrieve smallest number at iteration \(i)")
            print("Current minimum: \(currentMin)")
            XCTAssertLessThanOrEqual(currentMin,
                                        smallest,
                                        "Min heap was unbalanced at iteration \(i)")
            smallest = currentMin
            i += 1
        }
    }
}
