import XCTest
@testable import DataStructures

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

    func test_removedElementUpdateProperly_theList() throws {
        // Given
        let sut = LinkedList<Int>(initialElements: [1, 2, 3])

        // When
        sut.print()
        sut.remove(at: 1)
        sut.print()

        // Verify
        let specificElement = try XCTUnwrap(sut.element(at: 1),
                                            "Impossible to retrieve element at given index")
        XCTAssertEqual(specificElement, 3, "Elements aren't properly organized after removal")
        XCTAssertEqual(sut.count, 2, "Element's count is out of sync")
    }

    func test_listLinkage() {
        // Given
        print()
        print()
        let sut = LinkedList<Int>(initialElements: [1, 2, 3])

        // Verify
        sut.print()
        print()
        print()
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
}
