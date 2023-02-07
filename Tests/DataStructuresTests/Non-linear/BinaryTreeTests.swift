import DataStructures
import XCTest

final class BinaryTreeTests: XCTestCase {
    func preloadedTree() -> BinaryTree<Int> {
        let stubbedValues = [20, 23, 37, 39, 53, 54, 60, 76, 83, 100]
        let sut = BinaryTree<Int>()

        for i in stubbedValues {
            sut.insert(i)
        }

        return sut
    }

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
}
