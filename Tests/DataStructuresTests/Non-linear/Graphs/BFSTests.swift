import DataStructures
import XCTest

final class BFSTests: XCTestCase {
    func test_visitsAreRepeating_nodesWhileTransversingThem() {
        // Given
        var visitedNodes = Set<Int>()
        let assemblesGraphRoot = GraphNodesMother.assembleNumericalConnectedGraph()

        // When
        Search.BFSTraversal(from: assemblesGraphRoot) { currentNode in
            // Verify
            XCTAssertFalse(visitedNodes.contains(currentNode.value), "Node is visited more than once")
            visitedNodes.insert(currentNode.value)
        }
    }

    func test_expectedTransversalOrder_fromARootNode() {
        // Given
        let nodeA = GraphNodesMother.assembleAlphabeticalGraph()
        var visitedNodes = [GraphNode<String>]()

        // When
        Search.BFSTraversal(from: nodeA) { node in
            visitedNodes.append(node)
        }

        // Verify
        XCTAssertEqual(visitedNodes.map { $0.value }, ["A", "B", "C", "D", "E", "F"])
    }
}
