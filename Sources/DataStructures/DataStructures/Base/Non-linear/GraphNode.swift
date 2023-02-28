//
//  GraphNode.swift
//  
//
//  Created by Mauricio Chirino on 8/2/23.
//

import Foundation

/// Generic representation of a graph's node
public final class GraphNode<T: Equatable>: Hashable {
    /// Current value
    public let value: T
    
    /// Adjacent nodes
    public var neighbors: [GraphNode<T>] {
        return _neighbors
    }

    private var _neighbors: [GraphNode<T>]
    
    /// Default init
    /// - Parameters:
    ///   - value: node's value
    ///   - neighbors: adjacent nodes. Defaults to empty (`[]`)
    public init(value: T, neighbors: [GraphNode<T>] = []) {
        self.value = value
        self._neighbors = neighbors
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

    public static func == (lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.value == rhs.value
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
