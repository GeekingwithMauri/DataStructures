@testable import DataStructures
import XCTest

final class MinHeapTests: XCTestCase {
    private func preLoadHeap(upperBound: Int = 100,
                             iterations: Int = 15) -> MinHeap {
        let sut = MinHeap()
        var randomSet = Set<Int>()

        (1...iterations).forEach { _ in
            randomSet.insert(Int.random(in: 1...upperBound))
        }

        while !randomSet.isEmpty {
            sut.insert(randomSet.removeFirst())
        }

        return sut
    }

    func test_guaranteeElementsAreProperlyCounted() {
        // Given
        let iterations = 15

        // When
        let sut = preLoadHeap(iterations: iterations)

        // Verify
        XCTAssertEqual(sut.count, iterations, "Internal count isn't working as expected")
    }

    func test_guaranteeSiftUpAfterAdditions() {
        // Given
        let sut = MinHeap()

        // When
        sut.insert(10)
        sut.insert(4)
        sut.insert(15)
        sut.insert(2)

        // Verify
        XCTAssertEqual(sut.bottom?.value, 10, "Bottom value isn't properly set")
    }

    func test_guaranteeSiftDownAfterRemovals() throws {
        // Given
        let sut = MinHeap()
        sut.insert(10)
        sut.insert(4)
        sut.insert(15)

        // When
        let removed = try XCTUnwrap(sut.extractMin(), "No value removed from populated heap")

        // Verify
        XCTAssertEqual(removed, 4, "Min Heap removal isn't returning the lowest value")
        XCTAssertEqual(sut.peek(), 10, "Bottom value isn't properly set after removal")
    }

    func test_guaranteeElementsAreProperlyDiscounted() throws {
        // Given
        let sut = preLoadHeap(iterations: 5)
        var smallest: Int = .min

        // When
        while !sut.isEmpty {
            let currentMin = try XCTUnwrap(sut.extractMin(), "No min value to be extract from populated heap")
            XCTAssertGreaterThan(currentMin, smallest)
            smallest = currentMin
        }

        // Verify
        XCTAssertEqual(sut.count, 0, "Internal count isn't discounting elements as expected")
    }

    func test_guaranteeMinHeapExtraction_alwaysReturnsTheSmallestValue() throws {
        // Given
        var i = 1
        let sut = preLoadHeap(iterations: 5)

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
