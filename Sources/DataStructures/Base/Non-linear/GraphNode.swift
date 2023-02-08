//
//  GraphNode.swift
//  
//
//  Created by Mauricio Chirino on 8/2/23.
//

import Foundation

/// Generic representation of a graph's node
public final class GraphNode<T> {
    /// Current value
    public let value: T
    
    /// Adjacent nodes
    public let neighbors: [GraphNode<T>]
    
    /// Whether or node this node has been checked before. Useful for DFS / BFS algorithms
    public var isVisited: Bool
    
    /// Default init
    /// - Parameters:
    ///   - value: node's value
    ///   - neighbours: adjacent nodes. Defaults to empty (`[]`)
    ///   - isVisited: whether or node this node has been checked before. Defaults to `false`.
    public init(value: T,
                neighbours: [GraphNode<T>] = [],
                isVisited: Bool = false) {
        self.value = value
        self.neighbors = neighbours
        self.isVisited = isVisited
    }
}
