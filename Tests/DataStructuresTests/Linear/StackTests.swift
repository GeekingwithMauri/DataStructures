@testable import DataStructures
import XCTest

final class StackTests: XCTestCase {
    let stubbedNumberOfElements: Int = 6
    var sut: Stack<Int>!

    override func setUp() {
        super.setUp()
        // Given
        sut = Stack<Int>()
    }

    func test_stackEmptyFlagWorking_isAsExpected() {
        XCTAssert(sut.isEmpty, "Empty flag is throwing a false positive from start")

        sut.push(1)
        sut.pop()

        XCTAssert(sut.isEmpty, "Empty flag is throwing a false positive after interactions")
    }

    func test_elementsAreBeingProperlyStacked() throws {
        // Given
        let stubbedElements: [Int] = Array(1...stubbedNumberOfElements)

        // When
        stubbedElements.forEach { i in
            sut.push(i)
        }

        // Verify
        stubbedElements.reversed().forEach { i in
            let poppedElement = sut.pop() ?? -1
            XCTAssertEqual(i, poppedElement, "Added on stack in the wrong order")
        }
    }

    func test_elementsAreBeingCountAsTheyAreAdded() {
        // When
        for i in (0..<stubbedNumberOfElements) {
            sut.push(i)
        }

        // Verify
        XCTAssertEqual(stubbedNumberOfElements,
                       sut.count,
                       "Element count isn't tracking addition properly")
    }

    func test_elementsAreBeingDiscountOnSubtraction() {
        // Given
        for i in (0..<stubbedNumberOfElements) {
            sut.push(i)
        }

        // When
        (0..<stubbedNumberOfElements / 2).forEach { _ in
            sut.pop()
        }

        // Verify
        XCTAssertEqual(stubbedNumberOfElements / 2,
                       sut.count,
                       "Element count isn't tracking deletion properly")
    }

    func test_peekMethodReturnsTheRightValue() throws {
        // Given
        sut.push(1)
        sut.push(5)

        // When
        let topValue = try XCTUnwrap(sut.peek(), "No value peeked within the stack")

        // Verify
        XCTAssertEqual(topValue, 5, "Peeking method isn't working on stack")
        XCTAssertEqual(sut.count, 2, "Peeking method is altering stack elements count")
    }
}
