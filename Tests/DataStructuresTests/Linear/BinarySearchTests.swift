import DataStructures
import XCTest

final class BinarySearchTests: XCTestCase {
    func test_guaranteeElementIsFound_withinSortedArray() {
        // Given
        let sut = ArrayMother.assembleSorted()

        // Verify
        XCTAssertEqual(sut.binarySearch(for: 76), 2, "Value isn't found at the proper iteration")
    }

    func test_guaranteeLowestElementIsFound_withinSortedArray() {
        // Given
        let sut = ArrayMother.assembleSorted()
        let lowestValue = sut.first!
        let worstCase = sut.count / 2 - 1

        // When
        let iterationFound = sut.binarySearch(for: lowestValue)

        // Verify
        XCTAssertEqual(iterationFound, worstCase, "Lowest value isn't found at the proper iteration")
    }

    func test_guaranteeHighestElementIsFound_withinSortedArray() {
        // Given
        let sut = ArrayMother.assembleSorted()
        let highestValue = sut.last!
        let worstCase = sut.count / 2 - 1

        // When
        let iterationFound = sut.binarySearch(for: highestValue)

        // Verify
        XCTAssertEqual(iterationFound, worstCase, "Lowest value isn't found at the proper iteration")
    }

    func test_validateLowerBoundNonExistentElement() {
        // Given
        let sut = ArrayMother.assembleSorted()

        // Verify
        XCTAssertEqual(sut.binarySearch(for: -16), 0, "Value below lower bound shouldn't be found")
    }

    func test_validateUpperBoundNonExistentElement() {
        // Given
        let sut = ArrayMother.assembleSorted()

        // Verify
        XCTAssertEqual(sut.binarySearch(for: 16000), 0, "Value above upper bound shouldn't be found")
    }

    func test_guaranteeAllValuesAreFound_inPairArray() {
        // Given
        let sut = ArrayMother.assembleSorted()

        // When
        sut.forEach {
            // Verify
            XCTAssertGreaterThan(sut.binarySearch(for: $0),
                                 0,
                                 "\($0) isn't found within the array")
        }
    }

    func test_guaranteeAllValuesAreFound_inOddArray() {
        // Given
        let sut = ArrayMother.assembleOddSorted()

        // When
        sut.forEach {
            // Verify
            XCTAssertGreaterThan(sut.binarySearch(for: $0),
                                 0,
                                 "\($0) isn't found within the array")
        }
    }
}
