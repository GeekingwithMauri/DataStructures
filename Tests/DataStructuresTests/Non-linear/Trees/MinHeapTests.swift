import DataStructures
import XCTest

final class MinHeapTests: XCTestCase {
    private func preLoadHeap(iterations: Int = 15) -> MinHeap<Int> {
        let sut = MinHeap<Int>()
        var randomSet = Set<Int>()

        (1...iterations).forEach { _ in
            randomSet.insert(Int.random(in: 1...iterations * 10))
        }

        while !randomSet.isEmpty {
            sut.insert(randomSet.removeFirst())
        }

        return sut
    }

    func test_guaranteeSiftDownAfterRemovals() throws {
        // Given
        let sut = MinHeap<Int>()
        sut.insert(10)
        sut.insert(4, debugPrint: true)
        sut.insert(15, debugPrint: true)

        // When
        var removed = try XCTUnwrap(sut.extractMin(debugPrint: true), "No value removed from populated heap")

        // Verify
        XCTAssertEqual(removed, 4, "Min Heap removal isn't returning the lowest value")
        XCTAssertEqual(sut.peek(), 10, "Bottom value isn't properly set after removal")

        sut.insert(20, debugPrint: true)
        sut.insert(0, debugPrint: true)

        XCTAssertEqual(sut.peek(), 0, "Bottom value isn't properly set after removal")

        sut.insert(30, debugPrint: true)

        removed = try XCTUnwrap(sut.extractMin(debugPrint: true), "No value removed from populated heap")

        // Verify
        XCTAssertEqual(removed, 0, "Min Heap removal isn't returning the lowest value")
        XCTAssertEqual(sut.peek(), 10, "Bottom value isn't properly set after removal")

        removed = try XCTUnwrap(sut.extractMin(debugPrint: true), "No value removed from populated heap")

        // Verify
        XCTAssertEqual(removed, 10, "Min Heap removal isn't returning the lowest value")
        XCTAssertEqual(sut.peek(), 15, "Bottom value isn't properly set after removal")

        sut.insert(2, debugPrint: true)

        XCTAssertEqual(sut.peek(), 2, "Bottom value isn't properly set after removal")

        sut.insert(4, debugPrint: true)
        sut.insert(-1, debugPrint: true)
        sut.insert(-3, debugPrint: true)

        XCTAssertEqual(sut.peek(), -3, "Bottom value isn't properly set after removal")
    }

    func test_guaranteeElementsAreProperlyDiscounted() throws {
        // Given
        let sut = MinHeap<Int>()
        sut.insert(15)
        sut.insert(97)
        sut.insert(53)
        sut.insert(42)
        sut.insert(88)

        var smallest: Int = .min

        // When
        while !sut.isEmpty {
            let currentMin = try XCTUnwrap(sut.extractMin(), "No min value to be extract from populated heap")
            XCTAssertGreaterThan(currentMin, smallest, "Min heap unbalanced")
            smallest = currentMin
        }

        // Verify
        XCTAssertEqual(sut.count, 0, "Internal count isn't discounting elements as expected")
    }

    func test_guaranteeMinHeapExtraction_alwaysReturnsTheSmallestValue() throws {
        // Given
        var i = 1
        let sut = preLoadHeap(iterations: 55)

        // When
        var smallest = try XCTUnwrap(sut.extractMin(),
                                     "Could not retrieve the first smallest number")

        // Verify
        while !sut.isEmpty {
            let currentMin = try XCTUnwrap(sut.extractMin(),
                                           "Could not retrieve smallest number at iteration \(i)")
            print("Current minimum: \(currentMin)")
            XCTAssertLessThanOrEqual(smallest,
                                     currentMin,
                                     "Min heap was unbalanced at iteration \(i)")
            smallest = currentMin
            i += 1
        }
    }

    func test_guaranteeAllElementsArePrinted_byGraphicalPrintalMethod() {
        // Given
        let sut = preLoadHeap(iterations: 32)

        // When
        let printedElements = sut.graphicalRepresentation()

        // Verify
        XCTAssertEqual(printedElements, sut.count, "There are missing elements to be print")
    }
}
