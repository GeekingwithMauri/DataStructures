import XCTest
@testable import DataStructures
import Foundation

final class LinkedListTests: XCTestCase {
    let stubbedNumberOfElements: Int = 6
    var sut: LinkedList<Int>!

    override func setUp() {
        super.setUp()
        // Given
        sut = LinkedList<Int>()
    }

    func test_elementsAreBeingCountAsTheyAreAdded() {
        // When
        for i in (0..<stubbedNumberOfElements) {
            sut.append(i)
        }

        // Verify
        XCTAssertEqual(stubbedNumberOfElements,
                       sut.count,
                       "Element count isn't tracking addition properly")
    }

    func test_elementsAreBeingDiscountOnSubtraction() {
        // Given
        for i in (0..<3) {
            sut.append(i)
        }

        // When
        sut.remove(at: 1)

        // Verify
        XCTAssertEqual(2, sut.count, "Element count isn't tracking deletion properly")
    }

    func test_elementsAreProperlyRetrieved_byProvidedIndex() throws {
        // Given
        let sut = LinkedList<Int>(initialElements: [1, 2, 3])

        // When
        let specificElement = try XCTUnwrap(sut.element(at: 1),
                                            "Impossible to retrieve element at given index")

        // Verify
        XCTAssertEqual(specificElement, 2, "Fetched element isn't the right one")
    }

    func test_removeMiddleElementUpdateProperly_theList() throws {
        // Given
        let sut = LinkedList<Int>(initialElements: [1, 2, 3])

        // When
        sut.remove(at: 1)

        // Verify
        let specificElement = try XCTUnwrap(sut.element(at: 1),
                                            "Impossible to retrieve element at given index")
        XCTAssertEqual(specificElement, 3, "Elements aren't properly organized after removal")
        XCTAssertEqual(sut.count, 2, "Element's count is out of sync")
    }

    func test_removeHeadElementUpdateProperly_theList() throws {
        // Given
        let sut = LinkedList<Int>(initialElements: [1, 5, 3])

        // When
        sut.remove(at: 0)

        // Verify
        let specificElement = try XCTUnwrap(sut.element(at: 0),
                                            "Impossible to retrieve element at given index")
        XCTAssertEqual(specificElement, 5, "Elements aren't properly organized after removal")
        XCTAssertEqual(sut.count, 2, "Element's count is out of sync")
    }

    func test_removeTailElementUpdateProperly_theList() throws {
        // Given
        let sut = LinkedList<Int>(initialElements: [1, 5, 3])

        // When
        sut.remove(at: sut.count - 1)

        // Verify
        let specificElement = try XCTUnwrap(sut.element(at: sut.count - 1),
                                            "Impossible to retrieve element at given index")
        XCTAssertEqual(specificElement, 5, "Elements aren't properly organized after removal")
        XCTAssertEqual(sut.count, 2, "Element's count is out of sync")
    }

    func test_peekMethodReturnsTheRightValue() throws {
        // Given
        sut.append(1)
        sut.append(2)

        // When
        let frontValue = try XCTUnwrap(sut.peek(), "No value peeked within the queue")

        // Verify
        XCTAssertEqual(frontValue, 1, "Peeking method isn't working on queue")
        XCTAssertEqual(sut.count, 2, "Peeking method is altering queue elements count")
    }

    func test_listLinkage() {
        // Given
        let stubbedArray = [1, 2, 3]

        // When
        let sut = LinkedList<Int>(initialElements: [1, 2, 3])

        // Verify
        XCTAssertEqual(stubbedArray, sut.buildArray())
    }

    func test_listElementCount_forArrayInitialization() {
        // Given
        let stubbedArray = [1, 2, 3]

        // When
        let sut = LinkedList<Int>(initialElements: [1, 2, 3])

        // Verify
        XCTAssertEqual(sut.count,
                       stubbedArray.count,
                       "Element count isn't properly set whenever the linked list is initialized with an array")
    }
}
