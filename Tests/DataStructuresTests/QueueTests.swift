import XCTest
@testable import DataStructures

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

    func test_elementsAreBeingProperlyEnqueued() throws {
        // Given
        let stubbedElements: [Int] = Array(1...stubbedNumberOfElements)

        // When
        stubbedElements.forEach { i in
            sut.enqueue(i)
        }

        // Verify
        stubbedElements.forEach { i in
            let dequeuedElement = sut.dequeue() ?? -1
            XCTAssertEqual(i, dequeuedElement, "Added on stack in the wrong order")
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
}
