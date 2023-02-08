import DataStructures
import XCTest

final class BFSTests: XCTestCase {
    func assembleGraph() -> GraphNode<Int> {
        let node0 = GraphNode<Int>(value: 0)
        let node1 = GraphNode<Int>(value: 1)
        let node2 = GraphNode<Int>(value: 2)
        let node3 = GraphNode<Int>(value: 3)

        node0.neighbors = [node1]
        node1.neighbors = [node2]
        node2.neighbors = [node0, node3]
        node3.neighbors = [node2]

        return node0
    }
    
    func test_visitsAreNotGeneratingEndlessLoops() {
        // Given
        var visitedNodes = Set<Int>()
        let assemblesGraphRoot = assembleGraph()

        // When
        BFS.search(from: assemblesGraphRoot) { currentNode in
            // Verify
            XCTAssertFalse(visitedNodes.contains(currentNode.value), "Node is visited more than once")
            visitedNodes.insert(currentNode.value)
        }
    }
}
