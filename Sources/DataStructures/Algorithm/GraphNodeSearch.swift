//
//  GraphNodeSearch.swift
//  
//
//  Created by Mauricio Chirino on 8/2/23.
//

import Foundation

public enum Search {
    /// Transverse a graph in a _BFS_ fashion
    /// - Parameters:
    ///   - startingNode: root node to start the search from
    ///   - visitNode: closure function to execute on each visited node
    public static func BFSTraversal<T>(from startingNode: GraphNode<T>,
                                       visitNode: @escaping (GraphNode<T>) -> Void) {
        var seenNode: [GraphNode<T>: Bool] = [:]
        let queue = Queue<GraphNode<T>>()
        queue.enqueue(startingNode)

        while let currentNode = queue.dequeue() {
            if seenNode[currentNode] == nil {
                seenNode[currentNode] = true
                visitNode(currentNode)
            }

            for neighbor in currentNode.neighbors where seenNode[neighbor] == nil {
                queue.enqueue(neighbor)
            }
        }
    }

    /// Transverse a graph in a _DFS_ fashion
    /// - Parameters:
    ///   - startingNode: root node to start the search from
    ///   - visitNode: closure function to execute on each visited node
    public static func DFSTraversal<T>(from startingNode: GraphNode<T>,
                                       visitNode: @escaping (GraphNode<T>) -> Void) {
        var seenNode: [GraphNode<T>: Bool] = [:]
        let stack = Stack<GraphNode<T>>()
        stack.push(startingNode)

        while let currentNode = stack.pop() {
            if seenNode[currentNode] == nil {
                seenNode[currentNode] = true
                visitNode(currentNode)
            }

            for neighbor in currentNode.neighbors where seenNode[neighbor] == nil {
                stack.push(neighbor)
            }
        }
    }
}
