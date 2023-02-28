@testable import DataStructures
import XCTest

final class DFSTests: XCTestCase {
    func testDFS_withSampleDirectedGraph() {
        // Given
        let rootNode = GraphNodesMother.assembleAlphabeticalDirectedGraph()
        var visitedNodes = [GraphNode<String>]()

        // When
        Search.DFSTraversal(from: rootNode) { node in
            visitedNodes.append(node)
        }

        // Verify
        XCTAssertEqual(visitedNodes.map { $0.value }, ["A", "C", "F", "E", "B", "D"])
    }
}
