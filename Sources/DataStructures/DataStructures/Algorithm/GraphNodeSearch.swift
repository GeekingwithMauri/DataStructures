//
//  GraphNodeSearch.swift
//  
//
//  Created by Mauricio Chirino on 8/2/23.
//

import Foundation

public extension GraphNode {
    /// Transverse a graph in a _BFS_ fashion
    /// - Parameters:
    ///   - startingNode: root node to start the search from
    ///   - visitNode: closure function to execute on each visited node
    func BFSTraversal<T>(from startingNode: GraphNode<T>, visitNode: @escaping (GraphNode<T>) -> Void) {
        let queue = Queue<GraphNode<T>>()
        startingNode.isVisited = true
        queue.enqueue(startingNode)

        while let currentNode = queue.dequeue() {
            visitNode(currentNode)

            for neighbor in currentNode.neighbors where !neighbor.isVisited {
                neighbor.isVisited = true
                queue.enqueue(neighbor)
            }
        }
    }

    /// Transverse a graph in a _DFS_ fashion
    /// - Parameters:
    ///   - startingNode: root node to start the search from
    ///   - visitNode: closure function to execute on each visited node
    func DFSTraversal<T>(from startingNode: GraphNode<T>, visitNode: @escaping (GraphNode<T>) -> Void) {
        let stack = Stack<GraphNode<T>>()
        startingNode.isVisited = true
        stack.push(startingNode)

        while let currentNode = stack.pop() {
            visitNode(currentNode)

            for neighbor in currentNode.neighbors where !neighbor.isVisited {
                neighbor.isVisited = true
                stack.push(neighbor)
            }
        }
    }
}
