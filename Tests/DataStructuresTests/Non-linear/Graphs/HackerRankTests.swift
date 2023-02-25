import DataStructures
import XCTest

final class HackerRankTests: XCTestCase {
    func test_BFS_example1() {
        // Given
        let result = bfs(n: 5, m: 3, edges: [[1, 2], [1, 3], [3, 4]], s: 1)

        // Verify
        XCTAssertEqual(result, [6, 6, 12, -1])
    }

    func test_BFS_example2() {
        // Given
        let result = bfs(n: 4, m: 2, edges: [[1, 2], [1, 3]], s: 1)

        // Verify
        XCTAssertEqual(result, [6, 6,-1])
    }

    func test_BFS_example3() {
        // Given
        let result = bfs(n: 3, m: 1, edges: [[2, 3]], s: 2)

        // Verify
        XCTAssertEqual(result, [-1, 6])
    }
}

private extension HackerRankTests {
    func bfs(n: Int, m: Int, edges: [[Int]], s: Int) -> [Int] {
        var nodesHash: [Int: GraphNode<Int>] = [:]

        edges.forEach { currentEdge in
            if let existentNode = nodesHash[currentEdge.first!] {
                let newNode = GraphNode<Int>(value: currentEdge.last!)
                existentNode.add(edgeNode: newNode)

                nodesHash[currentEdge.last!] = newNode
                nodesHash[currentEdge.first!] = existentNode
            } else if let _ = nodesHash.values.first(where: { storedNode in
                if let _ = storedNode.neighbors.first(where: { currentNeighbor in
                    if currentNeighbor.value == currentEdge.first! {
                        let nestedNode = GraphNode<Int>(value: currentEdge.last!)
                        currentNeighbor.add(edgeNode: nestedNode)

                        nodesHash[currentEdge.last!] = nestedNode
                        return true
                    } else {
                        return false
                    }
                }) {
                    return true
                }

                return false
            }) {
                print("void")
            } else {
                let newNode = GraphNode<Int>(value: currentEdge.first!)
                let connectedNode = GraphNode<Int>(value: currentEdge.last!)
                newNode.add(edgeNode: connectedNode)

                nodesHash[currentEdge.first!] = newNode
                nodesHash[currentEdge.last!] = connectedNode
            }
        }

        guard let startingNode = nodesHash[s] else {
            return [-1]
        }

        nodesHash[s] = nil
        var result: [Int] = Array(repeating: -1, count: n - 1)

        nodesHash.values.forEach { visitingNode in
            startingNode.BFSTraversal(from: visitingNode) { visitedNode in
                if result[max(0, visitedNode.value - 2)] == -1 {
                    result[max(0, visitedNode.value - 2)] = 6
                } else {
                    result[max(0, visitedNode.value - 2)] += 6
                }
            }
        }

        return result
    }

    func visit(_ nodes: [GraphNode<Int>], from startingNode: GraphNode<Int>, totalConnections n: Int) -> [Int] {
        var result: [Int] = Array(repeating: -1, count: n - 1)

        nodes.forEach { visitingNode in
            startingNode.BFSTraversal(from: visitingNode) { visitedNode in
                if result[max(0, visitedNode.value - 2)] == -1 {
                    result[max(0, visitedNode.value - 2)] = 6
                } else {
                    result[max(0, visitedNode.value - 2)] += 6
                }
            }
        }

        return result
    }
}
