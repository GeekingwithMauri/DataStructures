//
//  DFS.swift
//  
//
//  Created by Mauricio Chirino on 9/2/23.
//

import Foundation

/// Depth-first search algorithm implementation
struct DFS {
    /// Transverse a graph in a _DFS_ fashion
    /// - Parameters:
    ///   - startingNode: root node to start the search from
    ///   - visitNode: closure function to execute on each visited node
    static func search<T>(from startingNode: GraphNode<T>, visitNode: @escaping (GraphNode<T>) -> Void) {
//        let queue = Queue<GraphNode<T>>()
//        startingNode.isVisited = true
//        queue.enqueue(startingNode)
//
//        while let currentNode = queue.dequeue() {
//            visitNode(currentNode)
//
//            for neighbor in currentNode.neighbors where !neighbor.isVisited {
//                neighbor.isVisited = true
//                queue.enqueue(neighbor)
//            }
//        }
    }
}
