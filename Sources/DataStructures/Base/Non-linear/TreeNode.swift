//
//  TreeNode.swift
//  
//
//  Created by Mauricio Chirino on 20/1/23.
//

import Foundation

/// Node representation for any tree-like structure
public final class TreeNode<T: Numeric> {
    /// Only its key value is accessible modifiable from the outside world
    public var value: T
    var parent: TreeNode?
    var left: TreeNode?
    var right: TreeNode?

    /// Initializes a tree node (root or leaf).
    ///
    /// This initializer is `internal` by design. Given that only the internal insertion methods within tree structures know when and where insert a new leaf.
    ///
    /// - Parameters:
    ///   - value: the key value associated with the leaf.
    ///   - parent: its parent node, should it exist.
    init(_ value: T, parent: TreeNode? = nil) {
        self.value = value
        self.parent = parent
    }
}
