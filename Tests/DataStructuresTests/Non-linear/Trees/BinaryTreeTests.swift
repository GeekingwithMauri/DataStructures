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
        let sut = BinaryTreeMother.buildSortedOne()

        // Verify
        XCTAssertEqual(sut.search(53),
                       2,
                       "Search isn't returning the expected tree's height at which the key is located")
    }
}
