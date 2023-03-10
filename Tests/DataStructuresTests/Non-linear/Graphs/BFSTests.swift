import DataStructures
import XCTest

final class BFSTests: XCTestCase {
    func test_uniqueVisits_whileTransversingNodes() {
        // Given
        var visitedNodes = Set<Int>()
        let assemblesGraphRoot = GraphNodesMother.assembleNumericalDirectedGraph()

        // When
        GraphNodeSearch.BFSTraversal(from: assemblesGraphRoot) { currentNode in
            // Verify
            XCTAssertFalse(visitedNodes.contains(currentNode.value), "Node is visited more than once")
            visitedNodes.insert(currentNode.value)
        }
    }

    func test_expectedTransversalOrder_fromARootNode() {
        // Given
        let nodeA = GraphNodesMother.assembleAlphabeticalDirectedGraph()
        var visitedNodes = [GraphNode<String>]()

        // When
        GraphNodeSearch.BFSTraversal(from: nodeA) { node in
            visitedNodes.append(node)
        }

        // Verify
        XCTAssertEqual(visitedNodes.map { $0.value }, ["A", "B", "C", "D", "E", "F"])
    }
}
