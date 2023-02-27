//
//  GraphNode.swift
//  
//
//  Created by Mauricio Chirino on 8/2/23.
//

import Foundation

/// Generic representation of a graph's node
public final class GraphNode<T: Equatable> {
    /// Current value
    public let value: T
    
    /// Adjacent nodes
    public var neighbors: [GraphNode<T>] {
        return _neighbors
    }

    private var _neighbors: [GraphNode<T>]
    
    /// Whether or node this node has been checked before. Useful for DFS / BFS algorithms
    public var isVisited: Bool
    
    /// Default init
    /// - Parameters:
    ///   - value: node's value
    ///   - neighbors: adjacent nodes. Defaults to empty (`[]`)
    ///   - isVisited: whether or node this node has been checked before. Defaults to `false`.
    public init(value: T,
                neighbors: [GraphNode<T>] = [],
                isVisited: Bool = false) {
        self.value = value
        self._neighbors = neighbors
        self.isVisited = isVisited
    }

    /// Adds individual edges to this node
    /// - Parameter edgeNode: edge to be added
    public func add(edgeNode: GraphNode<T>) {
        _neighbors.append(edgeNode)
    }

    /// Adds a batch of edges to this node
    /// - Parameter edgeNode: batch of edges to be added
    public func add(edges: [GraphNode<T>]) {
        _neighbors.append(contentsOf: edges)
    }

    /// Looks for the first neighbor to match a given key
    /// - Parameter key: key to match from
    /// - Returns: the first neighbor to match, should it exist.
    ///
    /// Complexity: _O(n)_, where `n` is the amount of neighbors.
    public func fetchNode(key: T) -> GraphNode<T>? {
        return _neighbors.first(where: {
            $0.value == key
        })
    }
}
