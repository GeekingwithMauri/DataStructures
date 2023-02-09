import DataStructures
import XCTest

final class BFSTests: XCTestCase {
    func test_visitsAreRepeating_nodesWhileTransversingThem() {
        // Given
        var visitedNodes = Set<Int>()
        let assemblesGraphRoot = GraphNodesMother.assembleNumericalConnectedGraph()

        // When
        BFS.search(from: assemblesGraphRoot) { currentNode in
            // Verify
            XCTAssertFalse(visitedNodes.contains(currentNode.value), "Node is visited more than once")
            visitedNodes.insert(currentNode.value)
        }
    }

    func test_expectedTransversalOrder_fromARootNode() throws {
        // Given
        let nodeA = GraphNodesMother.assembleAlphabeticalGraph()
        var visitedNodes = [GraphNode<String>]()

        // When
        BFS.search(from: nodeA) { node in
            visitedNodes.append(node)
        }

        // Verify
        XCTAssertEqual(visitedNodes.map { $0.value }, ["A", "B", "C", "D", "E", "F"])
    }
}