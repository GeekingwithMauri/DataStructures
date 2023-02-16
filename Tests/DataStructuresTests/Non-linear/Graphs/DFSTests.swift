@testable import DataStructures
import XCTest

final class DFSTests: XCTestCase {
    func testDFSWithSampleGraph() {
        // Given
        let rootNode = GraphNodesMother.assembleAlphabeticalGraph()
        var visitedNodes = [GraphNode<String>]()

        // When
        rootNode.DFSTraversal(from: rootNode) { node in
            visitedNodes.append(node)
        }

        // Verify
        XCTAssertEqual(visitedNodes.map { $0.value }, ["A", "C", "F", "E", "B", "D"])
    }
}
