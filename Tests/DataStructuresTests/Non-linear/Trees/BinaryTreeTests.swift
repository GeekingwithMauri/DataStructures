import DataStructures
import XCTest

final class BinaryTreeTests: XCTestCase {
    func test_guaranteeAllValuesAreCounted() {
        // Given
        let definedCount = 10
        let sut = BinaryTree<Int>()

        // When
        for i in 1...definedCount {
            sut.insert(i)
        }

        // Verify
        XCTAssertEqual(sut.count, definedCount, "Internal binary tree count isn't working as expected")
    }

    func test_guaranteeSearch_findsValueInATree() {
        // Given
        let sut = BinaryTreeMother.buildSkewOne()

        // Verify
        XCTAssertEqual(sut.search(53),
                       4,
                       "Search isn't returning the expected tree's height at which the key is located")
    }

    func test_guaranteeSearch_avoidsEndlessLoopForNonExistent_lowKeys() {
        // Given
        let sut = BinaryTreeMother.buildSkewOne()

        // Verify
        XCTAssertEqual(sut.search(-25),
                       -1,
                       "Search isn't returning the expected tree's height at which the key is located")
    }

    func test_guaranteeSearch_avoidsEndlessLoopForNonExistent_HighKeys() {
        // Given
        let sut = BinaryTreeMother.buildSkewOne()

        // Verify
        XCTAssertEqual(sut.search(2500),
                       -1,
                       "Search isn't returning the expected tree's height at which the key is located")
    }
}
