import XCTest
import DataStructures

final class DataStructuresTests: XCTestCase {
    let stubbedNumberOfElements: Int = 6
    var sut: Queue<Int>!

    override func setUp() {
        super.setUp()
        // Given
        sut = Queue<Int>()
    }

    func test_queueEmptyFlagWorking_isAsExpected() {
        XCTAssert(sut.isEmpty, "Empty flag is throwing a false positive from start")

        sut.enqueue(1)
        sut.dequeue()

        XCTAssert(sut.isEmpty, "Empty flag is throwing a false positive after interactions")
    }

    func test_elementsAreBeingProperlyEnqueued() {
        // Given
        let stubbedElements: [Int] = Array(1...stubbedNumberOfElements)

        // When
        stubbedElements.forEach { i in
            sut.enqueue(i)
        }

        // Verify
        stubbedElements.forEach { i in
            let dequeuedElement = sut.dequeue() ?? -1
            XCTAssertEqual(i, dequeuedElement, "Added on queue in the wrong order")
        }
    }

    func test_elementsAreBeingCountAsTheyAreAdded() {
        // When
        for i in (0..<stubbedNumberOfElements) {
            sut.enqueue(i)
        }

        // Verify
        XCTAssertEqual(stubbedNumberOfElements,
                       sut.count,
                       "Element count isn't tracking addition properly")
    }

    func test_elementsAreBeingDiscountOnSubtraction() {
        // Given
        for i in (0..<stubbedNumberOfElements) {
            sut.enqueue(i)
        }

        // When
        (0..<stubbedNumberOfElements / 2).forEach { _ in
            sut.dequeue()
        }

        // Verify
        XCTAssertEqual(stubbedNumberOfElements / 2,
                       sut.count,
                       "Element count isn't tracking deletion properly")
    }

    func test_peekMethodReturnsTheRightValue() throws {
        // Given
        sut.enqueue(1)
        sut.enqueue(2)

        // When
        let frontValue = try XCTUnwrap(sut.peek(), "No value peeked within the queue")

        // Verify
        XCTAssertEqual(frontValue, 1, "Peeking method isn't working on queue")
        XCTAssertEqual(sut.count, 2, "Peeking method is altering queue elements count")
    }
}
