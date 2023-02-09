import DataStructures
import XCTest

final class BFSTests: XCTestCase {
    private func assembleGraph() -> GraphNode<Int> {
        let node0 = GraphNode<Int>(value: 0)
        let node1 = GraphNode<Int>(value: 1)
        let node2 = GraphNode<Int>(value: 2)
        let node3 = GraphNode<Int>(value: 3)

        node0.add(edges: [node1])
        node1.add(edges: [node2])
        node2.add(edges: [node0, node3])
        node3.add(edges: [node2])

        return node0
    }

    private func assembleAlphabeticGraph() -> GraphNode<Character> {
        let nodeA = GraphNode<Character>(value: "A")
        let nodeB = GraphNode<Character>(value: "B")
        let nodeC = GraphNode<Character>(value: "C")
        let nodeD = GraphNode<Character>(value: "D")
        let nodeE = GraphNode<Character>(value: "E")
        let nodeF = GraphNode<Character>(value: "F")

        nodeA.add(edgeNode: nodeB)
        nodeA.add(edgeNode: nodeC)
        nodeB.add(edgeNode: nodeA)
        nodeB.add(edgeNode: nodeD)
        nodeB.add(edgeNode: nodeE)
        nodeC.add(edgeNode: nodeA)
        nodeC.add(edgeNode: nodeF)
        nodeD.add(edgeNode: nodeB)
        nodeE.add(edgeNode: nodeB)
        nodeE.add(edgeNode: nodeF)
        nodeF.add(edgeNode: nodeC)
        nodeF.add(edgeNode: nodeE)

        return nodeA
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

    func test_expectedTransversalOrder_fromARootNode() throws {
        // Given
        let nodeA = assembleAlphabeticGraph()
        var visitedNodes = [GraphNode<Character>]()

        // When
        BFS.search(from: nodeA) { node in
            visitedNodes.append(node)
        }

        // Verify
        XCTAssertEqual(visitedNodes.map { $0.value }, ["A", "B", "C", "D", "E", "F"])
    }
}
