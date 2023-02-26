import DataStructures
import XCTest

final class HackerRankTests: XCTestCase {
    func test_BFS_example1() {
        // Given
        let result = bfs(n: 5, m: 3, edges: [[3, 4], [1, 2], [1, 3]], s: 1)

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
            if let existentNode = nodesHash[currentEdge.first!],
                let previouslyConnectedNode  = nodesHash[currentEdge.last!] {
                existentNode.add(edgeNode: previouslyConnectedNode)
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

        var result: [Int] = Array(repeating: -1, count: n - 1)

        nodesHash.filter({ $0.key != s }).values.sorted(by: { $0.value < $1.value }).forEach { visitingNode in
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
