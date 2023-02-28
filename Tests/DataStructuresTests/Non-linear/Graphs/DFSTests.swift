@testable import DataStructures
import XCTest

final class DFSTests: XCTestCase {
    func testDFS_withSampleDirectedGraph() {
        // Given
        let rootNode = GraphNodesMother.assembleAlphabeticalDirectedGraph()
        var visitedNodes = [GraphNode<String>]()

        // When
        GraphNodeSearch.DFSTraversal(from: rootNode) { node in
            visitedNodes.append(node)
        }

        // Verify
        XCTAssertEqual(visitedNodes.map { $0.value }, ["A", "C", "F", "B", "E", "D"])
    }

    func testDFS_withSampleUndirectedGraph() {
        // Given
        let rootNode = GraphNodesMother.assembleAlphabeticalUndirectedGraph()
        var visitedNodes = [GraphNode<String>]()

        // When
        GraphNodeSearch.DFSTraversal(from: rootNode) { node in
            visitedNodes.append(node)
        }

        // Verify
        XCTAssertEqual(visitedNodes.map { $0.value }, ["A", "E", "F", "H", "D", "C", "B", "G"])
    }
}
