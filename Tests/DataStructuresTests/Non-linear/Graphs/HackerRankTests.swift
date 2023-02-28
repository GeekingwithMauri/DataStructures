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

    func _test_BFS_example4() {
        // Given
        let edges: [[Int]] = [
            [1,2], [1,3], [2,5], [3,4], [4,6]
        ]

        // When
        let result = bfs(n: 6, m: 5, edges: edges, s: 1)

        // Verify
        XCTAssertEqual(result, [6, 6, 12, 12, 18])
    }

    func _test_BFS_example5() {
        // Given
        let edges: [[Int]] = [
            [1,3], [3,4], [4,6]
        ]

        // When
        let result = bfs(n: 6, m: 3, edges: edges, s: 1)

        // Verify
        XCTAssertEqual(result, [-1, 6, 12, -1, 18])
    }
}

private extension HackerRankTests {
    func bfs(n: Int, m: Int, edges: [[Int]], s: Int) -> [Int] {
        var nodesHash: [Int: GraphNode<Int>] = [:]

        edges.forEach { currentEdge in
            if let existentNode = nodesHash[currentEdge.first!] {
                if let previouslyConnectedNode = nodesHash[currentEdge.last!] {
                    existentNode.add(edgeNode: previouslyConnectedNode)
                } else {
                    let newNode = GraphNode<Int>(value: currentEdge.last!)
                    existentNode.add(edgeNode: newNode)
                    nodesHash[currentEdge.last!] = newNode
                }
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

        nodesHash[s] = nil
        nodesHash.values.sorted(by: { $0.value < $1.value }).enumerated().forEach { index, visitingNode in
            // TODO: solve this. It's not starting from the top
            Search.BFSTraversal(from: visitingNode) { visitedNode in
//                guard startingNode.value != visitedNode.value else {
//                    return
//                }

                print("Iteration \(index + 1) = Node visited: \(visitedNode.value) from Node \(startingNode.value)")
                let indexValue: Int = max(0, visitedNode.value - 2)

                if result[indexValue] == -1 {
                    result[indexValue] = 6
                } else {
                    result[indexValue] += 6
                }
            }
        }

        return result
    }
}
